/// <reference types="cypress" />

const BASE_URL = "http://127.0.0.1:8000";

describe("Manajemen Peminjaman Ruangan (Rents)", () => {

    beforeEach(() => {
        cy.visit(`${BASE_URL}/login`);

        cy.get('input[name="login"]').should('be.visible').type("admin@gmail.com");
        cy.get('input[name="password"]').should('be.visible').type("admin");
        cy.get('button[type="submit"]').click();

        cy.url().should('include', '/dashboard');
    });

    it("Halaman Index Rents bisa dibuka", () => {
        cy.visit(`${BASE_URL}/dashboard/rents`);
        cy.contains("Pinjam").should("exist");
    });

    it("Berhasil membuat peminjaman baru", () => {
    cy.visit(`${BASE_URL}/dashboard/rents`);

    // klik tombol untuk membuka modal
    cy.get('button[data-bs-target="#pinjamRuangan"]').click();

    // modal benar-benar muncul
    cy.get('#pinjamRuangan').should('be.visible');

    // isi form modal
    cy.get("select[name=room_id]").should('be.visible').select("1");
    cy.get("input[name=date_use]").type("2025-01-15");
    cy.get("input[name=time_start_use]").type("08:00");
    cy.get("input[name=time_end_use]").type("10:00");
    cy.get("textarea[name=purpose]").type("Peminjaman untuk rapat testing otomatis");

    cy.get('#pinjamRuangan button[type=submit]').click();

    cy.url().should('include', '/dashboard/rents');
    cy.contains('Peminjaman diajukan').should('exist');
});


    it("Gagal membuat peminjaman karena waktu bentrok", () => {
        cy.visit(`${BASE_URL}/dashboard/rents`);

        cy.contains("Pinjam").click();
        cy.get("#pinjamRuangan").should("be.visible");

        cy.get("select[name=room_id]").select(1);
        cy.get("input[name=date_use]").type("2025-01-15");
        cy.get("input[name=time_start_use]").type("09:00");
        cy.get("input[name=time_end_use]").type("11:00");
        cy.get("textarea[name=purpose]").type("Tes bentrok jadwal");

        cy.get("#pinjamRuangan button[type=submit]").click();

        cy.contains("Upss... Ruangan yang Anda pilih sudah digunakan").should("exist");
    });

    it("Berhasil menghapus salah satu peminjaman", () => {
        cy.visit(`${BASE_URL}/dashboard/rents`);

        // cari tombol delete pertama
        cy.get('form[action^="/dashboard/rents/"] button[type="submit"]').first().click();

        cy.url().should("include", "/dashboard/rents");
        cy.contains("Data peminjaman berhasil dihapus").should("exist");
    });

    it("Berhasil mengakhiri transaksi", () => {
        // Ambil ID secara dinamis dari list
        cy.visit(`${BASE_URL}/dashboard/rents`);

        cy.get('a[href*="/endTransaction"]').first().then(($el) => {
            const href = $el.attr("href"); 
            cy.visit(`${BASE_URL}${href}`);

            cy.url().should("include", "/dashboard/rents");
        });
    });

    it("Export PDF berfungsi", () => {
        cy.request(`${BASE_URL}/dashboard/rents/export-pdf`).then((res) => {
            expect(res.status).to.eq(200);
            expect(res.headers["content-type"]).to.include("application/pdf");
        });
    });
});
