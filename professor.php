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

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th,
    td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    </style>
</head>

<body>
    <form method="GET">
        <h1>Welcome to Our Web Application Database Project</h1>
        <label for="search_ssn">Enter Professor SSN:</label>
        <input type="text" id="search_ssn" name="search_ssn">
        <input type="submit" value="Submit">
        <input type="button" value="Clear current query" onclick="location.href='professor.php';">
        <input type="button" value="Return to homepage" onclick="location.href='index.php';">
    </form>
    <form method="GET">
        <label for="search_course">Enter Course Number:</label>
        <input type="text" id="search_course" name="search_course">
        <label for="search_section">Enter Section Number:</label>
        <input type="text" id="search_section" name="search_section">
        <input type="submit" value="Submit">
        <input type="button" value="Clear current query" onclick="location.href='professor.php';">
        <input type="button" value="Return to homepage" onclick="location.href='index.php';">
    </form>
    <?php
      // username and password need to be replaced by your username and password
      // dbname is the same as your username

      $link = mysqli_connect('mariadb', 'cs332t31', '6NkdH1VD', 'cs332t31');
      if (!$link) {
        die('Could not connect: ' . mysql_error());
      }
      echo 'Database loaded successfully.<p>';

      //Professor SSN query
      if (isset($_GET['search_ssn'])) {
        $search_ssn = mysqli_real_escape_string($link, $_GET['search_ssn']);
        $prof_query = "SELECT S_Number, C_Number, Classroom, Meeting_day, Beginning_time, End_time FROM Section WHERE P_SSN = '$search_ssn'";
        $prof_result = $link->query($prof_query);
        
      if ($prof_result->num_rows > 0) {
        echo "<table>";
        echo "<tr><th>Section</th><th>Course Name</th><th>Classroom</th><th>Meeting Day</th><th>Time</th></tr>";
          
        while ($row = $prof_result->fetch_assoc()) {
          echo "<tr>";
          echo "<td>".$row["S_Number"]."</td>";
          echo "<td>".$row["C_Number"]."</td>";
          echo "<td>".$row["Classroom"]."</td>";
          echo "<td>".$row["Meeting_day"]."</td>";
          echo "<td>".$row["Beginning_time"]." - ".$row["End_time"]."</td>";
          echo "</tr>";
        }
          
        echo "</table>";
        } else {
          echo "No results found.";
        } 
        $prof_result->free_result();
      }

      //Course and section number query
      if (isset($_GET['search_course']) && isset($_GET['search_section'])) {
      $search_course = mysqli_real_escape_string($link, $_GET['search_course']);
      $search_section = mysqli_real_escape_string($link, $_GET['search_section']);
      $grades_query = "SELECT Grade, COUNT(*) as count FROM Enroll WHERE C_Number = '$search_course' AND S_Number = '$search_section' GROUP BY Grade";
      $grades_result = $link->query($grades_query);

      if ($grades_result->num_rows > 0) {
      echo "<table>";
      echo "<tr><th>Grade</th><th>Count</th></tr>";

      while ($row = $grades_result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>".$row["Grade"]."</td>";
        echo "<td>".$row["count"]."</td>";
        echo "</tr>";
      }

      echo "</table>";
      } else {
      echo "No results found.";
      }
      $grades_result->free_result();
      }

      $link->close();
    ?>
</body>

</html>