//no 1

SELECT mahasiswa.nim,mahasiswa.nama,mahasiswa.alamat,jurusan.namajurusan FROM mahasiswa JOIN jurusan ON mahasiswa.idjurusan = jurusan.idjurusan;

//no 2

ALTER TABLE mahasiswa add column umur INTEGER;

UPDATE mahasiswa SET umur = 20 WHERE nim = '2020001';

UPDATE mahasiswa SET umur = 19 WHERE nim = '2020002';

UPDATE mahasiswa SET umur = 22 WHERE nim = '2020003';

SELECT * FROM mahasiswa WHERE umur < 20;

//no 3

SELECT mahasiswa.* , kontrak.nilai FROM mahasiswa 

JOIN kontrak ON mahasiswa.nim = kontrak.nim 

WHERE kontrak.nilai = 'A' OR kontrak.nilai = 'B';

//no 4

INSERT INTO kontrak(nim,nipdosen,matakuliah,nilai)

VALUES

('2020001','002','2003','E'),

('2020001','001','2002','D'),

('2020003','001','2002','E');

SELECT mahasiswa.*, 

SUM(matakuliah.sks) as totalsks 

FROM mahasiswa JOIN kontrak ON mahasiswa.nim = kontrak.nim

JOIN matakuliah ON kontrak.matakuliah = matakuliah.idmk

GROUP BY mahasiswa.nim HAVING totalsks > 10;

//no 5

SELECT mahasiswa.* , matakuliah.namamk

FROM mahasiswa JOIN kontrak ON mahasiswa.nim = kontrak.nim

JOIN matakuliah ON kontrak.matakuliah = matakuliah.idmk

WHERE matakuliah.namamk = 'data mining';

//no 6

SELECT dosen.* , COUNT(DISTINCT mahasiswa.nim)

FROM dosen JOIN kontrak ON dosen.nip = kontrak.nipdosen

JOIN mahasiswa ON kontrak.nim = mahasiswa.nim 

GROUP BY dosen.nip;

//no 7

SELECT * FROM mahasiswa ORDER BY umur ASC;

//no 8

SELECT mahasiswa.* , jurusan.namajurusan , kontrak.nilai , matakuliah.namamk , dosen.nama FROM mahasiswa 

JOIN jurusan ON mahasiswa.idjurusan = jurusan.idjurusan

JOIN kontrak ON mahasiswa.nim = kontrak.nim 

JOIN matakuliah ON kontrak.matakuliah = matakuliah.idmk

JOIN dosen ON kontrak.nipdosen = dosen.nip

WHERE kontrak.nilai = 'D' OR kontrak.nilai = 'E';