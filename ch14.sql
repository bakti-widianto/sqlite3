CREATE TABLE jurusan (
  idjurusan TEXT PRIMARY KEY NOT NULL,
  namajurusan VARCHAR(50)
);

INSERT INTO jurusan (idjurusan, namajurusan)
VALUES('20201', 'teknik informatika'),('20202', 'manajemen');

CREATE TABLE mahasiswa (
    nim TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(50),
    alamat TEXT,
    idjurusan TEXT,
    FOREIGN KEY(idjurusan) REFERENCES jurusan(idjurusan)
  );

INSERT INTO mahasiswa(nim, nama, alamat, idjurusan)
VALUES('2020001','surya','bandung','20201'),('2020002','dita','jakarta','20202'),('2020003','tora','malang','20202');

CREATE TABLE dosen(
    nip TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(50)
);

INSERT INTO dosen (nip,nama)
VALUES('001','budi'),('002','bambang');

CREATE TABLE matakuliah(
    idmk TEXT PRIMARY KEY NOT NULL,
    namamk TEXT NOT NULL,
    sks INTEGER NOT NULL
);

INSERT INTO matakuliah(idmk,namamk,sks)
VALUES('2001','dasar pemrograman',3),('2002','manajemen keuangan',4),('2003','data mining',5);

CREATE TABLE kontrak(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 nim TEXT NOT NULL,
 nipdosen TEXT NOT NULL,
 matakuliah TEXT NOT NULL,
 nilai TEXT,

 FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
 FOREIGN KEY (nipdosen) REFERENCES dosen(nip),
 FOREIGN KEY (matakuliah) REFERENCES matakuliah(idmk)

);

INSERT INTO kontrak(nim,nipdosen,matakuliah,nilai)
VALUES('2020001','001','2001','B'),('2020002','002','2002','A'),('2020003','001','2003','C'),('2020003','001','2001','B');

