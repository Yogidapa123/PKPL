<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RegisterControllerTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function halaman_register_bisa_diakses()
    {
        $response = $this->get('/register');

        $response->assertStatus(200);
        $response->assertSee('Register');
    }

    /** @test */
    public function validasi_gagal_jika_field_kosong()
    {
        $response = $this->post('/register', []);

        $response->assertSessionHasErrors(['name', 'email', 'password']);
    }

    /** @test */
    public function user_baru_dapat_register_dengan_benar()
    {
        $data = [
            'name' => 'Yogi Testing',
            'email' => 'yogi@example.com',
            'password' => '1234',
        ];

        $response = $this->post('/register', $data);

        $response->assertRedirect('/login');
        $response->assertSessionHas('regisSuccess');

        $this->assertDatabaseHas('users', [
            'email' => 'yogi@example.com',
            'role_id' => 2,
        ]);
    }

    /** @test */
    public function register_gagal_jika_email_sudah_ada()
    {
        User::factory()->create([
            'email' => 'yogi@example.com',
        ]);

        $response = $this->post('/register', [
            'name' => 'Test User',
            'email' => 'yogi@example.com',
            'password' => '1234',
        ]);

        $response->assertSessionHasErrors(['email']);
    }
}
