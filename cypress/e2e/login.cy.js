/// <reference types="cypress" />

const BASE_URL = "http://127.0.0.1:8000";

describe("Login Authentication", () => {

  beforeEach(() => {
    cy.visit(`${BASE_URL}/login`);
  });

  it("Menampilkan halaman login", () => {
    cy.contains("Login").should("exist");
    cy.get('input[name="login"]').should("exist");
    cy.get('input[name="password"]').should("exist");
  });

  it("Gagal login dengan kredensial salah", () => {
    cy.get('input[name="login"]').type("yogip@gmail.com");
    cy.get('input[name="password"]').type("yogi");
    cy.get('button[type="submit"]').click();

    
  });

  it("Berhasil login sebagai admin (role_id = 1)", () => {
    cy.get('input[name="login"]').type("admin@gmail.com"); // sesuaikan
    cy.get('input[name="password"]').type("admin"); // sesuaikan
    cy.get('button[type="submit"]').click();

    cy.url().should("include", "/dashboard/admin");
  });

  it("Berhasil login sebagai user biasa (role_id = 2)", () => {
    cy.get('input[name="login"]').type("mahasiswa@gmail.com"); // sesuaikan
    cy.get('input[name="password"]').type("mahasiswa"); // sesuaikan
    cy.get('button[type="submit"]').click();

    cy.url().should("eq", `${BASE_URL}/`);
  });

  it("Berhasil logout", () => {
    // Login pengguna terlebih dahulu
    cy.get('input[name="login"]').type("admin@gmail.com");
    cy.get('input[name="password"]').type("admin");
    cy.get('button[type="submit"]').click();

    // Klik tombol logout
    cy.visit(`${BASE_URL}/dashboard/admin`);
    cy.contains("Logout").click({ force: false });

    // Redirect ke halaman utama
    cy.url().should("eq", `${BASE_URL}/`);
  });
});
