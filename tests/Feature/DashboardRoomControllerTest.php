<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\Building;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DashboardRoomController extends Controller
{
    public function index()
    {
        return view('dashboard.rooms.index', [
            'rooms' => Room::all()
        ]);
    }

    public function create()
    {
        return view('dashboard.rooms.create', [
            'buildings' => Building::all()
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'code' => 'required|unique:rooms,code',
            'name' => 'required',
            'floor' => 'required|integer',
            'capacity' => 'required|integer',
            'building_id' => 'required|exists:buildings,id',
            'type' => 'required',
            'description' => 'required',
            'img' => 'nullable|image',
        ]);

        // Handle Upload Gambar
        if ($request->hasFile('img')) {
            $filename = $validated['code'] . '.jpg';

            $request->file('img')->storeAs(
                'assets/images/ruang',
                $filename,
                'public'
            );

            $validated['img'] = $filename;
        }

        Room::create($validated);

        return redirect('/dashboard/rooms');
    }

    public function edit(Room $room)
    {
        return view('dashboard.rooms.edit', [
            'room' => $room,
            'buildings' => Building::all()
        ]);
    }

    public function update(Request $request, Room $room)
    {
        $validated = $request->validate([
            'code' => 'required|unique:rooms,code,' . $room->id,
            'name' => 'required',
            'floor' => 'required|integer',
            'capacity' => 'required|integer',
            'building_id' => 'required|exists:buildings,id',
            'type' => 'required',
            'description' => 'required',
            'img' => 'nullable|image',
        ]);

        // Upload gambar baru jika ada
        if ($request->hasFile('img')) {
            $filename = $validated['code'] . '.jpg';

            // Hapus file lama jika ada
            if ($room->img) {
                Storage::disk('public')->delete('assets/images/ruang/' . $room->img);
            }

            $request->file('img')->storeAs(
                'assets/images/ruang',
                $filename,
                'public'
            );

            $validated['img'] = $filename;
        }

        $room->update($validated);

        return redirect('/dashboard/rooms');
    }

    public function destroy(Room $room)
    {
        if ($room->img) {
            Storage::disk('public')->delete('assets/images/ruang/' . $room->img);
        }

        $room->delete();

        return redirect('/dashboard/rooms');
    }
}

