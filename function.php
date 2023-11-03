 <?php
    $conn = mysqli_connect("localhost", "root", "", "ananda_maulana_wahyudi_2202310054");


    function query($query)
    {
        global $conn;
        $result = mysqli_query($conn, $query);
        $rows = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $rows[] = $row;
        }
        return $rows;
    }

    function countBill($id)
    {
        $total = 0;
        $count  = query("SELECT * FROM pembayaran WHERE id_mahasiswa=$id");

        if ($count != NULL) {
            foreach ($count as $data) {
                $total += $data["nominal_terbayar"];
            }
        }

        return $total;
    }


    ?> 