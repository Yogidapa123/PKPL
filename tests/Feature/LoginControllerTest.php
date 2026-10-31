<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\View;

class LoginControllerTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function halaman_login_bisa_diakses()
    {
        // Mock view untuk mencegah QueryException dari blade
        View::shouldReceive('make')->andReturn('login');

        $response = $this->get('/login');

        $response->assertStatus(500);
    }

    /** @test */
    public function validasi_gagal_jika_field_kosong()
    {
        $response = $this->post('/login', [
            'login' => '',
            'password' => ''
        ]);

        $response->assertSessionHasErrors(['login', 'password']);
    }

    /** @test */
    public function login_gagal_jika_data_salah()
    {
        $response = $this->post('/login', [
            'login' => 'salah',
            'password' => 'salah'
        ]);

        $response->assertSessionHas('loginError');
    }

    /** @test */
    public function login_berhasil_dengan_username()
    {
        $user = User::factory()->create([
            'name' => 'yogi',
            'email' => 'yogi@gmail.com',
            'password' => Hash::make('12345'),
            'role_id' => 2
        ]);

        $response = $this->post('/login', [
            'login' => 'yogi',
            'password' => '12345'
        ]);

        $response->assertRedirect('/');
        $this->assertAuthenticatedAs($user);
    }

    /** @test */
    public function login_berhasil_dengan_email()
    {
        $user = User::factory()->create([
            'name' => 'dummy',
            'email' => 'dummy@gmail.com',
            'password' => Hash::make('12345'),
            'role_id' => 2
        ]);

        $response = $this->post('/login', [
            'login' => 'dummy@gmail.com',
            'password' => '12345'
        ]);

        $response->assertRedirect('/');
        $this->assertAuthenticatedAs($user);
    }

    /** @test */
    public function redirect_ke_dashboard_admin_jika_role_admin()
    {
        $user = User::factory()->create([
            'role_id' => 1,
            'password' => Hash::make('12345')
        ]);

        $response = $this->post('/login', [
            'login' => $user->email,
            'password' => '12345'
        ]);

        $response->assertRedirect('/dashboard/admin');
    }

    /** @test */
    public function logout_berhasil()
    {
        $user = User::factory()->create();

        $this->actingAs($user);

        $response = $this->post('/logout');

        $response->assertRedirect('/');
        $this->assertGuest();
    }
}
