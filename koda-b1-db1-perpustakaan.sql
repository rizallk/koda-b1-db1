-- DDL ==============================================
CREATE TABLE kategori (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(50)
);

CREATE TABLE rak_buku (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(50)
);

CREATE TABLE petugas (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  nik VARCHAR(16) UNIQUE,
  jabatan VARCHAR(20),
  alamat VARCHAR(80)
);

CREATE TABLE buku (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  tahun INT NOT NULL,
  kategori_id INT REFERENCES kategori(id),
  rak_buku_id INT REFERENCES rak_buku(id),
  petugas_id INT REFERENCES petugas(id)
);

CREATE TABLE peminjam (
  id SERIAL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  nik VARCHAR(16) UNIQUE,
  alamat VARCHAR(80),
  umur INT,
  no_hp VARCHAR(20)
);

CREATE TABLE peminjam_buku (
  id SERIAL PRIMARY KEY,
  peminjam_id INT NOT NULL REFERENCES peminjam(id),
  buku_id INT NOT NULL REFERENCES buku(id),
  tanggal_pinjam TIMESTAMPTZ DEFAULT NOW(),
  tanggal_balik TIMESTAMPTZ
);

-- DML ==============================================

INSERT INTO rak_buku (nama) VALUES
('A-1'),
('B-1'),
('C-1'),
('D-1'),
('A-2'),
('B-2'),
('C-2'),
('A-3'),
('B-3'),
('C-3');

INSERT INTO kategori (nama) VALUES
('Karya Umum'),
('Filsafat'),
('Ilmu Sosial'),
('Bahasa'),
('Teknologi'),
('Seni'),
('Komputer'),
('Pemrograman'),
('Sejarah'),
('Komik');

INSERT INTO petugas (nama, nik, jabatan, alamat) VALUES
('Anto Suherman', '7171081234567890', 'Kepala', 'Bogor'),
('Budi Gunawan', '7171081334567890', 'Wakil', 'Jakarta'),
('Sugeng', NULL, 'Staff', 'Cibubur'),
('Richard', '7171081438567890', NULL, 'Cileungsi'),
('Antonio', NULL, NULL, NULL),
('Putin Sutrisno', NULL, NULL, NULL),
('Ucup Harahap', '7171081434567890', 'Staff', NULL),
('Salvius Lengkong', NULL, NULL, 'Tangerang'),
('Heilbert Mapali', NULL, 'Staff', NULL),
('Albert Einstein', '7171081634567890', NULL, 'Jerman');

INSERT INTO buku (nama, tahun, kategori_id, rak_buku_id, petugas_id) VALUES
('Pengenalan Pemrograman Python', 2023, 8, 1, 3),
('Belajar JavaScript', 2011, 8, 4, 9),
('Islam Ala Prabowo', 2026, 2, 8, 3),
('Dunia Sophie', 2024, 8, 4, 9),
('Pengantar Ilmu Hukum', 2021, 3, 2, 8),
('KBBI', 2003, 4, 8, 3),
('Sejarah Indonesia', 2009, 8, 6, 2),
('Naruto', 2010, 8, 4, 6),
('Anatomi Tubuh Manusia', 2005, 8, 3, 7),
('Laskar Pelangi', 2001, 8, 7, 1);

INSERT INTO peminjam (nama, nik, alamat, umur, no_hp) VALUES
('Rizal', '7171082101234678', 'Manado', 23, '082347711639'),
('Dina', NULL, 'Tanahwangko', NULL, '081234567890'),
('Dita', '71711234567890', 'Bengkol', 22, NULL),
('Sandhika', NULL, NULL, 43, '082134567890'),
('Eko', NULL, NULL, NULL, '081235758839'),
('Ilham', '7171090823827320', 'Jakarta Barat', 25, NULL),
('Kristo', '7171082387283728', 'Banten', 30, '0857837872940'),
('Lukman', NULL, NULL, NULL, NULL),
('Galih', '7171081201281028', 'Bandung', NULL, '0898237283728'),
('Andi', NULL, 'Depok', NULL, '0896643843647');

INSERT INTO peminjam_buku (peminjam_id, buku_id, tanggal_pinjam, tanggal_balik) VALUES
(1, 4, '2025-01-08 18:05:01', '2025-01-09 10:08:01'),
(4, 2, '2025-02-10 10:07:01', '2025-02-11 09:30:00'),
(2, 7, '2025-02-19 09:03:03', '2025-02-25 11:07:36'),
(2, 3, '2025-05-01 13:09:06', '2025-05-08 14:00:40'),
(5, 8, '2025-05-09 15:05:03', '2025-05-19 13:08:20'),
(1, 9, '2026-06-23 16:05:04', NULL),
(6, 3, '2026-07-14 10:02:10', '2026-08-01 18:00:36'),
(8, 4, '2026-09-28 11:06:20', '2026-10-02 10:30:01'),
(3, 2, '2026-10-03 09:01:19', '2026-10-10 14:28:45'),
(7, 9, '2026-10-04 09:08:09', NULL);