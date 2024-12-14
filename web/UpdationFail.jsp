
<%@page import="model.LoginAuthenticator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Icon</title>
    <style>
        
        
        
        /* Table styling */
        table {
            border-collapse: collapse;
            width: 50%;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        /* Add space between rows */
        tr {
            margin-bottom: 10px;
        }

        /* Add alternating background color for the rows */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        th {
            text-align: left;
            padding: 10px;
        }

        /* Styling for the headings */
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        /* Add padding to the left of the container */
          /* Center the entire content */
          
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        body {
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #f8f9fa;
            padding: 10px;
        }
        .navbar1 {
            display: flex;
            float: right;
            align-items: flex-end;
            justify-content: space-between;
            background-color: #f8f9fa;
            padding: 10px;
        }
        

        .home-icon {
            font-size: 24px;
            text-decoration: none;
            color: #000;
            display: flex;
            align-items: center;
        }

        .home-icon:hover {
            color: #007bff; /* Change color on hover */
        }

        .home-icon img {
            width: 24px;
            height: 24px;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    
    <%
            
        String name="";
        String email="";
        String mobile="";
        String course="";
        String level="";
        String password="";
        String city="";
        try
        {
             String email1=(String) session.getAttribute("email");
             Statement st= DBConnector.getStatement(); 
            String query="SELECT * FROM cj WHERE email='"+email1+"'";
            ResultSet rs=st.executeQuery(query);
             while(rs.next())
            {
                name=rs.getString(1);
                email=rs.getString(2);
                mobile=rs.getString(3);
                course=rs.getString(4);
                level=rs.getString(5);  
                password=rs.getString(6);
                city=rs.getString(7);
            }
             
         }
        catch(SQLException e)
            {
               System.out.println(e);        
            }
              
             
     %>
     
    

    <div class="navbar">
        <!-- Home Icon -->
        <%
            LoginAuthenticator l1=new LoginAuthenticator();
            boolean login= l1.isLogin(email, password);
            if(login)
            {
                
            
            HttpSession session1= request.getSession(true);
           session1.setAttribute("email", email);
           
        %>
        <a href="Home.jsp" class="home-icon">
            <img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt="Home Icon">
            Home
        </a>
        <%
            }
             else
             {
                 response.sendRedirect("Login.html");
              }
        %>
        
         <div class="navbar1">
             <a href="Logout.jsp"><h3>Sign Out</h3></a>
          
     </div>
    </div>
    
     <div >
          <table border="0">
             <tr>
                 <td>Name:</td>
                 <td><%=name%></td>
             <form action="Name.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
             </tr>
             <tr>
                 <td>Email:</td>
                 <td><%=email%></td>
                 <form action="Email.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
                 
             </tr>
             <tr>
                 <td>Mobile Number</td>
                 <td><%=mobile%></td>
                  <form action="Mobile.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
             </tr>
             <tr>
                 <td>Course:</td>
                 <td><%=course%></td>
                  <form action="Course.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
             </tr>
             <tr>
                 <td>Level:</td>
                 <td><%=level%></td>
                  <form action="Level.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
             </tr> 
             <tr>
                 <td>Password:</td>
                 <td><%=password%></td>
                 <form action="Password.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
             </tr>
              <tr>
                 <td>City:</td>
                 <td><%=city%></td>
                 <form action="City.html" method="post">
                 <td><input type="submit" value="Edit"</td>
             </form>
             </tr>
             <tr>
                 <td></td>
                 <td><h2>Updation Fail....!</h2></td>
             </tr>
     </table>
     </div>
</body>
</html>
