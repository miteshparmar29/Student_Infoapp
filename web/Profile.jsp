<%@page import="model.LoginAuthenticator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Page</title>
    <style>
        /* General body styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #FF6A00, #FF9500); /* Orange gradient */
            color: #333;
        }

        /* Navbar styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .home-icon {
            font-size: 20px;
            text-decoration: none;
            color: #333;
            display: flex;
            align-items: center;
            transition: color 0.3s ease;
        }

        .home-icon:hover {
            color: #FF6A00;
        }

        .home-icon img {
            width: 24px;
            height: 24px;
            margin-right: 8px;
        }

        .navbar1 {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .navbar1 h3,
        .navbar1 input[type="submit"] {
            font-size: 14px;
            color: #fff;
            background-color: #FF6A00;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .navbar1 h3:hover,
        .navbar1 input[type="submit"]:hover {
            background-color: #FF4500;
        }

        /* Centering the content */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
            text-align: center;
        }

        /* Styling the table */
        table {
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #FF6A00;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        td input[type="submit"] {
            font-size: 14px;
            color: #fff;
            background-color: #FF6A00;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        td input[type="submit"]:hover {
            background-color: #FF4500;
        }
    </style>
</head>
<body>
    <%
        String name = "";
        String email = "";
        String mobile = "";
        String course = "";
        String level = "";
        String password = "";
        String city = "";
        try {
            String email1 = (String) session.getAttribute("email");
            Statement st = DBConnector.getStatement();
            String query = "SELECT * FROM cj WHERE email='" + email1 + "'";
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                name = rs.getString(1);
                email = rs.getString(2);
                mobile = rs.getString(3);
                course = rs.getString(4);
                level = rs.getString(5);
                password = rs.getString(6);
                city = rs.getString(7);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    %>

    <!-- Navbar -->
    <div class="navbar">
        <%
            LoginAuthenticator l1 = new LoginAuthenticator();
            boolean login = l1.isLogin(email, password);
            if (login) {
                HttpSession session1 = request.getSession(true);
                session1.setAttribute("email", email);
        %>
        <a href="Home.jsp" class="home-icon">
            <img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt="Home Icon">
            Home
        </a>
        <%
            } else {
                response.sendRedirect("Login.html");
            }
        %>

        <div class="navbar1">
            <form action="Logout.jsp" method="post">
                <input type="hidden" name="email" value="<%= email %>">
                <input type="submit" value="Sign Out">
            </form>
            <form action="Deleteaccount" method="post">
                <input type="hidden" name="email" value="<%= email %>">
                <input type="submit" value="Delete Account">
            </form>
        </div>
    </div>

    <!-- Profile Details -->
    <div class="container">
        <h2>Your Profile</h2>
        <table>
            <tr>
                <td>Name:</td>
                <td><%= name %></td>
                <td>
                    <form action="Name.html" method="post">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%= email %></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>Mobile Number:</td>
                <td><%= mobile %></td>
                <td>
                    <form action="Mobile.html" method="post">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
            <tr>
                <td>Course:</td>
                <td><%= course %></td>
                <td>
                    <form action="Course.html" method="post">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
            <tr>
                <td>Level:</td>
                <td><%= level %></td>
                <td>
                    <form action="Level.html" method="post">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><%= password %></td>
                <td>
                    <form action="Password.html" method="post">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
            <tr>
                <td>City:</td>
                <td><%= city %></td>
                <td>
                    <form action="City.html" method="post">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>