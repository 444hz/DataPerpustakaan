Aplikasi sederhana ini merupakan sebuah contoh penerapan sistem basis data. Aplikasi ini mengolah data perpustakaan. Data akan disimpan di database `perpus` yang berisi beberapa tabel sebagai berikut, `buku`, `pengarang`, `penerbit`, `mahasiswa`, dan `peminjaman`.

### Tampilan Utama 
![Preview Image](DataPerpustakaan/Images/Preview.jpg)
_Tampilan Form Buku_

### Program SQL
Berikut ini adalah kode SQL untuk membuat tabel-tabel tersebut:
```sql
-- Tabel Buku
CREATE TABLE buku (
    judul VARCHAR(255),
    genre ENUM('Agama', 'Fantasi', 'Filsafat', 'Pendidikan', 'Psikologi', 'Sains', 'Sejarah', 'Self-Improvement', 'Teknologi'),
    ISBN VARCHAR(20) PRIMARY KEY,
    pengarang VARCHAR(255),
    penerbit VARCHAR(255),
    status_pinjam BOOLEAN
);

-- Tabel Pengarang
CREATE TABLE pengarang (
    id_pengarang INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255),
    tanggal_lahir DATE,
    kebangsaan VARCHAR(100)
);

-- Tabel Penerbit
CREATE TABLE penerbit (
    id_penerbit INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255),
    kota VARCHAR(100),
    website VARCHAR(255),
    no_telp VARCHAR(20)
);

-- Tabel Anggota (Mahasiswa)
CREATE TABLE mahasiswa (
    NIM VARCHAR(9) PRIMARY KEY,
    nama VARCHAR(255),
    fakultas ENUM('Ekonomi', 'FKIP', 'Hukum', 'Pertanian', 'Psikologi','Teknik'),
    tanggal_lahir DATE,
    no_telp VARCHAR(20)
);

-- Tabel Peminjaman
CREATE TABLE peminjaman (
    id_pinjam INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(20),
    NIM VARCHAR(9),
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    status_kembali BOOLEAN, 
    FOREIGN KEY (ISBN) REFERENCES buku(ISBN),
    FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM)
);
```

### Ringkasan
- Setiap form memiliki 5 `button` yang memiliki fungsi masing-masing, yaitu:
	- `Tambahkan`
	- `Tampilkan`
	- `Edit`
	- `Hapus`
	- `Cari`
- Apabila akan memasukkan data buku baru akan dilakukan beberapa validasi, diantaranya:
	- Setiap field tidak boleh kosong.
	- Field `pengarang` hanya boleh diisi oleh pengarang yang sudah tersimpan di tabel `pengarang`. Jika belum, maka muncul `MessageBox` perintah untuk menyimpan data pengarang baru.
	- Berlaku sama dengan field `penerbit`.
- Fungsi `Cari` akan melakukan _query_ lalu mengisi setiap form `TextBox`, `DropDownList`, serta `RadioButtonList` dengan value  
- Fungsi `Edit` dan `Hapus` dilakukan setelah melakukan fungsi `Cari` agar lebih efektif.
- Fungsi `Tambahkan` pada form `Peminjaman` nilai `status_kembali = 0` adalah _default_. Lalu mengubah `status_pinjam` pada tabel `buku` menjadi `status_pinjam = 1`.
- Fungsi `Buku Dipinjam` pada form `Buku` menampilkan kolom `judul` (_unique_), `ISBN`, `NIM` pada tabel `peminjaman` dan `nama` berdasarkan `NIM` pada tabel `mahasiswa` menggunakan `JOIN`. Data yang diambil dari tabel `peminjaman` diurutkan pada `tanggal_pinjam` terbaru.
```sql
-- Join Tabel Buku, Peminjaman, dan Mahasiswa
SELECT buku.judul, buku.ISBN, mahasiswa.NIM, mahasiswa.nama, buku.status_pinjam
FROM buku 
LEFT JOIN peminjaman ON buku.ISBN = peminjaman.ISBN
LEFT JOIN mahasiswa ON peminjaman.NIM = mahasiswa.NIM 
WHERE Buku.status_pinjam = 1
AND (peminjaman.ISBN, peminjaman.tanggal_pinjam) 
IN (SELECT ISBN, MAX(tanggal_pinjam) FROM peminjaman GROUP BY ISBN);
```


> Apabila suka atau merasa terbantu dengan repositori ini, jangan lupa untuk memberikan bintang ★
