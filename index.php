<!DOCTYPE html>
<html>
<?php
session_start();
require 'connection.php';
$conn = Connect();

if (isset($_SESSION['login_customer'])) {
    header("location: customer_index.php"); //Redirecting
}
?>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Axl Rentals</title>
    <link rel="shortcut icon" type="image/png" href="assets/img/P.png">
    <link rel="manifest" href="manifest.json">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/user.css">
    <link rel="stylesheet" href="assets/w3css/w3.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="color: black">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                    </button>
                <a class="navbar-brand page-scroll" href="index.php" style="color: blue;" >
                   Axl Rentals </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->

            <?php
if (isset($_SESSION['login_client'])) {
    ?>
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php" style="color: blue;"><b>Home</b></a>
                    </li>
                    <li>
                        <a href="#" style="color: blue;"><span class="glyphicon glyphicon-user" style="color: blue;"></span> Welcome <?php echo $_SESSION['login_client']; ?></a>
                    </li>
                    <li>
                    <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: blue;"><span class="glyphicon glyphicon-user" style="color: blue;"></span> Control Panel <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="entercar.php" style="color: blue;">Add Car</a></li>

              <li> <a href="clientview.php" style="color: blue;">History</a></li>
              <li> <a href="pending_bookings_admin.php" style="color: blue;">Pending Bookings</a></li>
              <li> <a href="pending_users.php" style="color: blue;">Pending Users</a></li>
              <li> <a href="all_users.php" style="color: blue;">Users</a></li>

            </ul>
            </li>
          </ul>
                    </li>
                    <li>
                        <a href="logout.php" style="color: blue;"><span class="glyphicon glyphicon-log-out" style="color: blue;"></span> Logout</a>
                    </li>
                </ul>
            </div>

            <?php
} else if (isset($_SESSION['login_customer'])) {
    ?>
                        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="customer_index.php" style="color: blue;"><b>Home</b></a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user" style="color: blue;"></span> Welcome <?php echo $_SESSION['login_customer']; ?></a>
                    </li>
                    <li> <a href="pending_bookings.php" style="color: blue;"> Pending Bookings</a></li>
                    <li> <a href="mybookings.php" style="color: blue;"> Booking History</a></li>

                    <li> <a href="prereturncar.php" style="color: blue;">Return My Car</a></li>
                    <li>
                        <a href="logout.php" style="color: blue;"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>

            <?php
} else {
    ?>

            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php" style="color: blue;"><b>Home</b></a>
                    </li>
                    <li>
                        <a href="customerlogin.php" style="color: blue;"><b>Login</b></a>
                    </li>
                </ul>
            </div>
                <?php }
?>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="bgimg-1">
        <header class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <h1 class="brand-heading" style="color: black">Axl Rentals</h1>
                            <p class="intro-text">
                            </p>
                            <a href="#sec2" class="btn btn-circle page-scroll blink">
                                <i class="fa fa-angle-double-down animated"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>

    <div id="sec2" style="color: #777;background-color:white;text-align:center;padding:50px 80px;text-align: justify;">
        <h3 style="text-align:center;">Available Cars</h3>
<br>
        <section class="menu-content">
            <?php
$sql1 = "SELECT * FROM cars WHERE car_availability='yes'";
$result1 = mysqli_query($conn, $sql1);

if (mysqli_num_rows($result1) > 0) {
    while ($row1 = mysqli_fetch_assoc($result1)) {
        $car_id = $row1["car_id"];
        $car_name = $row1["car_name"];
        $car_img = $row1["car_img"];
        $fare = $row1["car_fare"];

        ?>
            <a href="booking.php?id=<?php echo ($car_id) ?>">
            <div class="sub-menu">


            <img class="card-img-top" src="<?php echo $car_img; ?>" alt="Card image cap">
            <h5><b> <?php echo $car_name; ?> </b></h5>
            <h6><?php echo '₱' . number_format($fare, 2); ?> per day</h6>


            </div>
            </a>
            <?php }} else {
    ?>
<h1> No cars available :( </h1>
                <?php
}
?>
        </section>

    </div>
    <footer class="site-footer">
        <div class="container">
            <hr>
            <div class="row">
                <div class="col-sm-6">
                    <h5>© <?php echo date("Y"); ?> Axl Rentals</h5>
                </div>

            </div>
        </div>
    </footer>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCuoe93lQkgRaC7FB8fMOr_g1dmMRwKng&callback=myMap" type="text/javascript"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="assets/js/jquery.easing.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="assets/js/theme.js"></script>
</body>

</html>