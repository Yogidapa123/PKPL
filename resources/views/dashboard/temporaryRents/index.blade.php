@extends('dashboard.layouts.main')

@section('container')
<div class="col-md-10 p-0">
    <div class="card-body text-end">
        <div class="table-responsive">
            <div class="d-flex justify-content-start">
                {{ $rents->links() }}
            </div>
            <table class="table table-hover table-stripped table-bordered text-center dt-head-center" id="datatable">
                <thead class="table-info">
                    <tr>
                        <th>No.</th>
                        <th>Nama Ruangan</th>
                        <th>Tanggal</th>
                        <th>Nama Peminjam</th>
                        <th>Mulai Pinjam</th>
                        <th>Selesai Pinjam</th>
                        <th>Kegiatan</th>
                        <th>Phone</th>
                        <th>Mulai Transaksi</th>
                        <th>Status Pinjam</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @if($rents->count() > 0)
                        @foreach($rents as $rent)
                            <tr style="background-color: #ffffff;">
                                <th>{{ $loop->iteration }}</th>
                                <td>{{ $rent->room->name ?? '-' }}</td>
                                <td>{{ $rent->date_use }}</td>
                                <td>{{ $rent->user->name }}</td>
                                <td>{{ $rent->time_start_use }}</td>
                                <td>{{ $rent->time_end_use }}</td>
                                <td>{{ $rent->purpose }}</td>
                                <td>{{ $rent->user->phone }}</td>
                                <td>{{ $rent->transaction_start }}</td>
                                <td>{{ $rent->status }}</td>

                                @if(auth()->user()->role_id === 1)
                                    <td>
                                        <!-- Tombol Accept -->
                                        <form action="{{ route('rent.verify', $rent->id) }}" method="POST" style="display:inline">
                                            @csrf
                                            <input type="hidden" name="status" value="accepted">
                                            <button type="submit" class="btn btn-success mb-2" style="padding:2px 10px">
                                                <i class="bi bi-check-lg"></i>
                                            </button>
                                        </form>
                                        <!-- Tombol Decline -->
                                        <form action="{{ route('rent.verify', $rent->id) }}" method="POST" style="display:inline">
                                            @csrf
                                            <input type="hidden" name="status" value="rejected">
                                            <button type="submit" class="btn btn-danger mb-2" style="padding:2px 10px">
                                                <i class="bi bi-x-lg"></i>
                                            </button>
                                        </form>
                                    </td>
                                @endif
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="11" class="text-center">-- Belum Ada Daftar Peminjam --</td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
