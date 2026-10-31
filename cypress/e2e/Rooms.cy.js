/// <reference types="cypress" />

const BASE_URL = "http://127.0.0.1:8000";

// Abaikan error aplikasi
Cypress.on("uncaught:exception", () => false);

describe("Manajemen Data Ruangan (Rooms)", () => {

  beforeEach(() => {
    cy.visit(`${BASE_URL}/login`);

    cy.get('input[name="login"]').type("admin@gmail.com");
    cy.get('input[name="password"]').type("admin");
    cy.get('button[type="submit"]').click();

    cy.url().should('include', '/dashboard');
  });

  it("Halaman Index Rooms bisa dibuka", () => {
    cy.visit(`${BASE_URL}/dashboard/rooms`);
    cy.contains("Daftar Ruangan").should("exist");
  });

  it("Berhasil menambahkan Room baru", () => {
    cy.visit(`${BASE_URL}/dashboard/rooms`);

    cy.contains("Tambah Ruangan").scrollIntoView().click({ force: true });

    cy.get("#addRoom")
      .should("be.visible")
      .and("have.class", "show");

    cy.get("#addRoom input[name=code]").type("Lab 1 GSG");
    cy.get("#addRoom input[name=name]").type("Lab 1 GSG");
    cy.get("#addRoom input[name=floor]").type("2");
    cy.get("#addRoom input[name=capacity]").type("50");
    cy.get("#addRoom select[name=building_id]").select("2");
    cy.get("#addRoom select[name=type]").select("Ruang Umum");

    cy.get("#addRoom textarea[name=description]")
      .type("Ruangan rapat pimpinan dengan kapasitas besar.");

    cy.get("#addRoom button[type=submit]").click({ force: true });

    cy.url().should("include", "/dashboard/rooms");
    cy.contains("Lab 1 GSG").should("exist");
  });

  it("Berhasil mengupdate Room", () => {
    cy.visit(`${BASE_URL}/dashboard/rooms`);

    cy.get(".editroom").first().scrollIntoView().click({ force: true });

    cy.get("#editRoom")
      .should("be.visible")
      .and("have.class", "show");

    cy.get('#editRoom input[name=name]')
      .clear()
      .type("Update1");

    cy.get('#editRoom textarea[name=description]')
      .clear()
      .type("Update deskripsi minimal 50 karakter lorem ipsum lorem ipsum.");

    cy.get('#editRoom button[type=submit]').click({ force: true });

    cy.url().should("include", "/dashboard/rooms");
    cy.contains("Lab 1 GSG").should("exist");
  });

  
  it("Berhasil menghapus Room", () => {
  cy.visit(`${BASE_URL}/dashboard/rooms`);

  cy.get("table tbody tr").then($rows => {
    const countBefore = $rows.length;

    // klik tombol delete khusus di baris pertama


    // setelah delete harus berkurang
  });
});


});
