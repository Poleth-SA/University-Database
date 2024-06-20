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
        <label for="search_course">Enter Course Number:</label>
        <input type="text" id="search_course" name="search_course">
        <input type="submit" value="Submit">
        <input type="button" value="Clear current query" onclick="location.href='student.php';">
        <input type="button" value="Return to homepage" onclick="location.href='index.php';">
    </form>
    <form method="GET">
        <label for="cw_id">Enter Student CWID:</label>
        <input type="text" id="cw_id" name="cw_id">
        <input type="submit" value="Submit">
        <input type="button" value="Clear current query" onclick="location.href='student.php';">
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

      // Course sections query
      if (isset($_GET['search_course'])) {
        $search_course = mysqli_real_escape_string($link, $_GET['search_course']);
        $section_query = "SELECT Section.S_Number, Section.Classroom, Section.Meeting_day, Section.Beginning_time, Section.End_time, COUNT(*) AS Enrollment FROM Section INNER JOIN Enroll ON Section.S_Number = Enroll.S_Number AND Section.C_Number = Enroll.C_Number WHERE Section.C_Number = '$search_course' GROUP BY Section.S_Number";
        $section_result = $link->query($section_query);
    
      if ($section_result->num_rows > 0) {
        echo "<table>";
        echo "<tr><th>Section</th><th>Classroom</th><th>Meeting Day</th><th>Time</th><th>Enrollment</th></tr>";
      
        while ($row = $section_result->fetch_assoc()) {
          echo "<tr>";
          echo "<td>".$row["S_Number"]."</td>";
          echo "<td>".$row["Classroom"]."</td>";
          echo "<td>".$row["Meeting_day"]."</td>";
          echo "<td>".$row["Beginning_time"]." - ".$row["End_time"]."</td>";
          echo "<td>".$row["Enrollment"]."</td>";
          echo "</tr>";
      }
      echo "</table>";
      } else {
      echo "No results found.";
      }
    
      $section_result->free_result();
    }

    // Check for a submitted CWID
    if (isset($_GET['cw_id'])) {
    $cwid = mysqli_real_escape_string($link, $_GET['cw_id']);
    
    // Query the database for the student's courses and grades
    $query = "SELECT Course.C_Number, Course.Title, Enroll.Grade
              FROM Enroll
              INNER JOIN Course ON Enroll.C_Number = Course.C_Number
              WHERE Enroll.Student = '$cwid'";
    $result = mysqli_query($link, $query);
    
    // Display the results in a table
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>Course Number</th><th>Course Title</th><th>Grade</th></tr>";
      
      while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>".$row["C_Number"]."</td>";
        echo "<td>".$row["Title"]."</td>";
        echo "<td>".$row["Grade"]."</td>";
        echo "</tr>";
      }
      
      echo "</table>";
    } else {
      echo "No results found.";
    }
    
    // Free the result set
    mysqli_free_result($result);
    }

    $link->close();
    ?>
</body>

</html>