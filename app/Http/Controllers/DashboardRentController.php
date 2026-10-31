<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Rent;
use App\Models\Room;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Http;


class DashboardRentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('dashboard.rents.index', [
            'adminRents' => Rent::latest()->paginate(10),
            'userRents' => Rent::where('user_id', auth()->user()->id)->get(),
            'title' => "Peminjaman",
            'rooms' => Room::all(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // public function store(Request $request)
    // {
    //     $validatedData = $request->validate([
    //         'room_id' => 'required',
    //         'time_start_use' => 'required',
    //         'time_end_use' => 'required',
    //         'purpose' => 'required|max:250',
    //     ]);
    //     $validatedData['user_id'] = auth()->user()->id;
    //     $validatedData['transaction_start'] = now();
    //     $validatedData['status'] = 'pending';
    //     $validatedData['transaction_end'] = null;

    //     Rent::create($validatedData);

    //     return redirect('/dashboard/rents')->with('rentSuccess', 'Peminjaman diajukan. Harap tunggu konfirmasi admin.');
    // }
    public function store(Request $request)
    {
    // Validasi input
    $validatedData = $request->validate([
        'room_id' => 'required',
        'date_use' => 'required|date',
        'time_start_use' => 'required',
        'time_end_use' => 'required|after:time_start_use',
        'purpose' => 'required|max:250',
    ]);

    // Format tanggal & waktu
    $validatedData['date_use'] = Carbon::parse($validatedData['date_use'])->format('Y-m-d');
    $validatedData['time_start_use'] = Carbon::parse($validatedData['time_start_use'])->format('H:i:s');
    $validatedData['time_end_use'] = Carbon::parse($validatedData['time_end_use'])->format('H:i:s');

    // Tambahan data otomatis
    $validatedData['user_id'] = auth()->user()->id;
    $validatedData['transaction_start'] = now();
    $validatedData['status'] = 'pending';
    $validatedData['transaction_end'] = null;

    // ================================
    // CEK BENTROK WAKTU PEMINJAMAN
    // ================================
    $conflict = Rent::where('room_id', $validatedData['room_id'])
        ->where('date_use', $validatedData['date_use'])
        ->where(function ($query) use ($validatedData) {
            $query->where('time_start_use', '<', $validatedData['time_end_use'])
                  ->where('time_end_use', '>', $validatedData['time_start_use']);
        })
        ->exists();

    if ($conflict) {

        // kirim error ke form
        Session::flash('alert', [
            'message' => 'Upss... Ruangan sudah dipinjam pada jam tersebut!',
            'avatar' => asset('assets/images/face.png')
        ]);

        return back()
                ->withErrors(['time_start_use' => 'Jam yang dipilih sudah dipinjam orang lain.'])
                ->withInput();
    }

    // ================================
    // SIMPAN DATA JIKA TIDAK BENTROK
    // ================================
    Rent::create($validatedData);
    

    // Periksa peran pengguna
    if (auth()->user()->role_id === 1) {
        // Admin
        return redirect('/dashboard/rents')->with('rentSuccess', 'Peminjaman diajukan. Harap tunggu konfirmasi admin.');
    } elseif (auth()->user()->role_id === 2) {
        // User
        return redirect('/daftarpinjam')->with('rentSuccess', 'Peminjaman diajukan. Harap tunggu konfirmasi admin.');
    }
}


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Rent  $rent
     * @return \Illuminate\Http\Response
     */
    public function show(Rent $rent)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Rent  $rent
     * @return \Illuminate\Http\Response
     */
    public function edit(Rent $rent)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Rent  $rent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rent $rent)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Rent  $rent
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rent $rent)
    {
        Rent::destroy($rent->id);
        return redirect('/dashboard/rents')->with('deleteRent', 'Data peminjaman berhasil dihapus');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Rent  $rent
     * @return \Illuminate\Http\Response
     */
    public function endTransaction($id)
    {
        $transaction = [
            'transaction_end' => now(),
            'status' => 'selesai',
        ];

        Rent::where('id', $id)->update($transaction);

        return redirect('/dashboard/rents');
    }

    public function exportPDF()
    {
        $adminRents = Rent::with('room', 'user')->get();

        $pdf = Pdf::loadView('dashboard.rents.pdf', compact('adminRents'));
        return $pdf->download('daftar_peminjaman.pdf');
        
    }

    public function verify(Request $request, Rent $rent)
    {
    // Validasi input status
    $request->validate([
        'status' => 'required|in:accepted,rejected',
    ]);

    // Update status peminjaman
    $rent->status = $request->status;
    $rent->save();

    // Cek user & room
    if (!$rent->user || !$rent->room) {
        return back()->with('error', 'Data user atau ruangan tidak valid.');
    }

    // Normalisasi nomor WA
    $phone = preg_replace('/[^0-9]/', '', $rent->user->phone);
    if (substr($phone, 0, 1) === '0') {
        $phone = '62' . substr($phone, 1);
    }

    // Buat pesan WA
    if ($request->status === 'accepted') {
        $message = "📢 *PEMINJAMAN DITERIMA*\n\n"
            . "Halo *{$rent->user->name}*\n\n"
            . "🏫 Ruangan: {$rent->room->name}\n"
            . "📅 Tanggal: {$rent->date_use}\n"
            . "🕒 {$rent->time_start_use} - {$rent->time_end_use}\n\n"
            . "Terima kasih.";
    } else {
        $message = "❌ *PEMINJAMAN DITOLAK*\n\n"
            . "Halo *{$rent->user->name}*\n"
            . "Silakan hubungi admin.";
    }

    // Mode debug (opsional)
    if (env('FONNTE_DEBUG')) {
        $phone = env('FONNTE_DEBUG_PHONE');
        $message = 'Test dari Laravel via Fonnte ✅';
    }

    // Kirim WA via Fonnte API
    $response = Http::withHeaders([
        'Authorization' => env('FONNTE_TOKEN'),
    ])->post('https://api.fonnte.com/send', [
        'target' => $phone,
        'message' => $message,
    ]);

    if (!$response->ok()) {
        \Log::error('Fonnte Error', $response->json());
        return back()->with('error', 'WA gagal dikirim');
    }

    return back()->with('success', 'Status & WhatsApp berhasil dikirim.');
    }

}
