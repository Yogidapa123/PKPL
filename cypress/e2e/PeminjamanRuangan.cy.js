/// <reference types="cypress" />

const BASE_URL = "http://127.0.0.1:8000";

describe("Peminjaman Ruangan - Auto Update Status", () => {

    beforeEach(() => {
        // Login dulu
        cy.request("POST", `${BASE_URL}/login`, {
            email: "admin@gmail.com",
            password: "admin"
        }).then(() => {
            cy.visit(`${BASE_URL}/dashboard/rents`);
        });
    });

    it("Halaman index peminjaman bisa dibuka", () => {
        cy.url().should("include", "/dashboard/rents");
        cy.contains("Peminjaman").should("exist");
    });

    it("Status peminjaman otomatis berubah dari 'dipinjam' menjadi 'dikembalikan' jika waktu sudah lewat", () => {

        // 1. Tambahkan peminjaman yang waktunya sudah lewat
        cy.request("POST", `${BASE_URL}/api/testing/create-expired-rent`, {
            room_id: 1,
            user_id: 1,
            date_use: "2025-01-01",
            time_start_use: "08:00:00",
            time_end_use: "09:00:00",
            status: "dipinjam"
        }).then((response) => {
            const rentId = response.body.id;

            // 2. Kunjungi halaman index (controller akan auto-update)
            cy.visit(`${BASE_URL}/dashboard/rents`);

            // 3. Pastikan status sudah berubah
            cy.contains(`ID: ${rentId}`).parent().within(() => {
                cy.contains("dikembalikan").should("exist");
            });
        });
    });

});
