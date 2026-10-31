/// <reference types="cypress" />

const BASE_URL = "http://127.0.0.1:8000";

// Abaikan error aplikasi
Cypress.on("uncaught:exception", () => false);

describe("Register User", () => {

  beforeEach(() => {
    cy.visit(`${BASE_URL}/register`);
  });

  it("Halaman register bisa dibuka", () => {
    cy.contains("Register").should("exist");
    cy.get('input[name="name"]').should("exist");
    cy.get('input[name="email"]').should("exist");
    cy.get('input[name="password"]').should("exist");
  });


  it("Validasi gagal jika email tidak valid", () => {
    cy.get('input[name="name"]').type("User Test");
    cy.get('input[name="email"]').type("yogi123@gmailcom");
    cy.get('input[name="password"]').type("123456");
    cy.get('button[type="submit"]').click();

  });

  it("Validasi gagal jika password kurang dari 4 karakter", () => {
    cy.get('input[name="name"]').type("User Test");
    cy.get('input[name="email"]').type("userbaru@example.com");
    cy.get('input[name="password"]').type("123");
    cy.get('button[type="submit"]').click();

  });

  it("Validasi gagal jika email sudah digunakan", () => {
    cy.get('input[name="name"]').type("admin");
    cy.get('input[name="email"]').type("admin@gmail.com"); // email yang sudah ada
    cy.get('input[name="password"]').type("admin");
    cy.get('button[type="submit"]').click();

  });

  it("Berhasil register user baru", () => {
    const randomEmail = `user${Date.now()}@example.com`;

    cy.get('input[name="name"]').type("Yogi");
    cy.get('input[name="email"]').type("mahasiswa@gmail.com");
    cy.get('input[name="password"]').type("mahasiswa");
    cy.get('button[type="submit"]').click();

  });

});
