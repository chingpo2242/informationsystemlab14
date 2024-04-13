<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - View Orders</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background-image: url('https://cdn.wallpapersafari.com/93/26/Stkyof.gif');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; /* Added */
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
            color: #fff;
        }

        table {
            width: 80%;
            margin: 20px auto; /* Adjusted margin */
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Back button styles */
        .back-btn {
            position: absolute; 
            top: 20px; 
            left: 20px; /
        }
        .back-btn a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .back-btn a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h2>Order History</h2>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Total Cost</th>
            <!-- Add more columns as needed -->
        </tr>
        <?php
        session_start();

        // Check if user is logged in as customer
        if (!isset($_SESSION['username']) || empty($_SESSION['username'])) {
            header("Location: login.php");
            exit();
        }

        // Check if user is customer
        include('db_connection.php');
        $username = $_SESSION['username'];
        $sql = "SELECT role FROM users WHERE username='$username'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        if ($row['role'] != 'customer') {
            echo "Unauthorized access!";
            exit();
        }

        // Retrieve orders for the current customer
        $sql = "SELECT * FROM orders WHERE customer_username='$username'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>".$row["order_id"]."</td>";
                echo "<td>".$row["product_name"]."</td>";
                echo "<td>".$row["quantity"]."</td>"; // Display quantity
                echo "<td>".$row["total_cost"]."</td>"; // Display total cost
                // Add more columns as needed
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='4'>No orders found</td></tr>";
        }
        ?>
    </table>
    <div class="back-btn">
            <a href="customer_dashboard.php">Back to Dashboard</a>
        </div>
</body>
</html>
