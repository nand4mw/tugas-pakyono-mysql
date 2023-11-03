 <?php
    include './function.php';

    $mahasiswa = mysqli_query($conn, "SELECT * FROM mahasiswa JOIN prodi on mahasiswa.id_prodi = prodi.id_prodi join sistem_kuliah on mahasiswa.id_sistem_kuliah = sistem_kuliah.id_sistem_kuliah join status on mahasiswa.id_status_mhs = status.id_status_mhs  ");


    $totalpembayaran = mysqli_query($conn, "SELECT m.nama, m.npm, m.tgl_lahir, m.tempat_lahir, m.jenis_kelamin, m.no_hp, p.nama_prodi, s.nama_sistem_kuliah, st.status_mhs, SUM(pb.nominal_terbayar) AS Total_Pembayaran 
    FROM mahasiswa AS m 
    JOIN prodi AS p ON m.id_prodi = p.id_prodi 
    JOIN pembayaran AS pb ON m.id_mahasiswa = pb.id_mahasiswa 
    JOIN (SELECT id_sistem_kuliah, nama_sistem_kuliah FROM sistem_kuliah) AS s ON m.id_sistem_kuliah = s.id_sistem_kuliah 
    JOIN (SELECT id_status_mhs, status_mhs FROM status) AS st ON m.id_status_mhs = st.id_status_mhs 
    GROUP BY m.nama, m.npm, m.tgl_lahir, m.tempat_lahir, m.jenis_kelamin, m.no_hp, p.nama_prodi, s.nama_sistem_kuliah, st.status_mhs 
    ORDER BY m.nama;");





    ?>

 <!DOCTYPE html>
 <html lang="en">

 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Tabel</title>
 </head>

 <body>

     <table border="1" cellpadding="10" cellspacing="0">
         <tr>
             <th>No</th>
             <th>Nama</th>
             <th>npm</th>
             <th>Tanggal Lahir</th>
             <th>Tempat Lahir</th>
             <th>Jenis Kelamin</th>
             <th>No Hp</th>
             <th>nama prodi</th>
             <th>nama sistem kuliah</th>
             <th>Status Mahasiswa</th>
             <th>Total Pembayaran</th>
         </tr>
         <?php $i = 1;

            foreach ($mahasiswa as $mhs) : ?>
             <tr>
                 <td> <?= $i++ ?> </td>
                 <td> <?= $mhs['nama'] ?> </td>
                 <td> <?= $mhs['npm'] ?> </td>
                 <td> <?= $mhs['tgl_lahir'] ?> </td>
                 <td> <?= $mhs['tempat_lahir'] ?> </td>
                 <td> <?= $mhs['jenis_kelamin'] ?> </td>
                 <td> <?= $mhs['no_hp'] ?> </td>
                 <td> <?= $mhs['nama_prodi'] ?> </td>
                 <td> <?= $mhs['nama_sistem_kuliah'] ?> </td>
                 <td> <?= $mhs['status_mhs'] ?> </td>
                 <?php foreach ($totalpembayaran as $total) : ?>
                     <td> <?= $total['nominal_terbayar'] ?> </td>
                 <?php endforeach; ?>
             </tr>
         <?php

            endforeach; ?>
     </table>
 </body>

 </html>