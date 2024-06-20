<html>

<head>
    <title>Database Project</title>
    <style>
    h1 {
        font-size: 3em;
        color: #333;
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    </style>
</head>

<body>
    <form method="POST">
        <h1>Welcome to Our Web Application Database Project</h1>
        <label for="user_type">Are you a professor or a student?</label>
        <select name="user_type" id="user_type">
            <option value="professor">Professor</option>
            <option value="student">Student</option>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>

</html>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $user_type = $_POST["user_type"];
  if ($user_type == "professor") {
    header("Location: professor.php");
    exit();
  } elseif ($user_type == "student") {
    header("Location: student.php");
    exit();
  }
}
?>