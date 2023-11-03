 <?php
    include './function.php';

    $data = query("SELECT m.*, p.nama_prodi, p.jenjang_prodi, sk.nama_sistem_kuliah, s.status_mhs FROM mahasiswa AS m JOIN prodi AS p ON m.id_prodi = p.id_prodi JOIN sistem_kuliah AS sk ON m.id_sistem_kuliah = sk.id_sistem_kuliah JOIN status AS s ON m.id_status_mhs = s.id_status_mhs")
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

            foreach ($data as $mhs) : ?>
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
                 <td> <?= countBill($mhs["id_mahasiswa"]) ?> </td>
             </tr>
         <?php

            endforeach; ?>
     </table>
 </body>

 </html>