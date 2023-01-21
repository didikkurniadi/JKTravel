<?php
include 'connect_db.php';
$searchErr = '';
$employee_details='';
if(isset($_POST['save']))
{
    if(!empty($_POST['search']))
    {
        $search = $_POST['search'];
        $stmt = $con->prepare("select a.NAMA as NAME_WISATA, c.NAMA_KATEGORI, w.NAMA_WILAYAH, HARGA from DETAIL_WISATA a, CATEGORY c, WILAYAH w where a.ID_KATEGORY=c.ID and w.ID=a.ID_WILAYAH and (a.NAMA LIKE '%$search%' or c.NAMA_KATEGORI like '%$search%' or w.NAMA_WILAYAH like '%$search%')");
        $stmt->execute();
        $employee_details = $stmt->fetchAll(PDO::FETCH_ASSOC);
        //print_r($employee_details);
         
    }
    else
    {
        $searchErr = "Please enter the information";
    }
    
}
 
?>
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tourest - Explore the Jakarta</title>

  <link rel="stylesheet" href="./assets/css/style.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Comforter+Brush&family=Heebo:wght@400;500;600;700&display=swap"
    rel="stylesheet">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #D6EEEE;
}
</style>
</head>
 
<body id="top">
  <header class="header" data-header>
    <div class="container">
      <a href="#">
        <h1 class="logo">JKTravel</h1>
      </a>
        <button class="nav-toggle-btn" data-nav-toggle-btn aria-label="Toggle Menu">
          <ion-icon name="menu-outline" class="open"></ion-icon>
          <ion-icon name="close-outline" class="close"></ion-icon>
        </button>
        <nav class="navbar">
          <ul class="navbar-list">
            <li>
              <a href="index.html" class="navbar-link">Home</a>
            </li>
            <li>
              <a href="index_about.html" class="navbar-link">About Us</a>
            </li>
            <li>
              <a href="index_tour.html" class="navbar-link">Tours</a>
            </li>
          </ul>
            <a href="search.php" class="navbar-link">Search</a>
        </nav>
    </div>
  </header>
  <main>
    <div class="container">
    <form class="form-horizontal" action="#" method="post">
    <div class="row">
        <div class="form-group">
            <label class="control-label col-sm-4" for="email"><b>Mencari Informasi Wisata</b>:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="search" placeholder="search here">
            </div>
            <div class="col-sm-2">
              <button type="submit" name="save" class="btn btn-success btn-sm">Submit</button>
            </div>
        </div>
        <div class="form-group">
            <span class="error" style="color:red;">* <?php echo $searchErr;?></span>
        </div>
         
    </div>
    </form>
    <br/><br/>
    <h3><u>Hasil Pencarian</u></h3><br/>
    <div class="table-responsive">          
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Nama Wisata</th>
            <th>Kategory</th>
            <th>Wilayah</th>
            <th>HTM</th>
          </tr>
        </thead>
        <tbody>
                <?php
                 if(!$employee_details)
                 {
                    echo '<tr>No data found</tr>';
                 }
                 else{
                    foreach($employee_details as $key=>$value)
                    {
                        ?>
                    <tr>
                        <td><?php echo $key+1;?></td>
                        <td><?php echo $value['NAME_WISATA'];?></td>
                        <td><?php echo $value['NAMA_KATEGORI'];?></td>
                        <td><?php echo $value['NAMA_WILAYAH'];?></td>
                        <td><?php echo $value['HARGA'];?></td>
                    </tr>
                         
                        <?php
                    }
                     
                 }
                ?>
             
         </tbody>
      </table>
    </div>
</div>
</main>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>