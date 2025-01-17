package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationChecker extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("Registration.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String course = request.getParameter("courses");
        String level = request.getParameter("level");
        String password = request.getParameter("password");
        String city=request.getParameter("city");
        PrintWriter out = response.getWriter();
        int i = 0;

        try {
           
            Statement st = DBConnector.getStatement();
            String query = "SELECT email FROM cj WHERE email='" + email + "'";
            ResultSet rs = st.executeQuery(query);

            boolean emailExists = false;
            if (rs.next()) {
                emailExists = true; 
            }
            
            if(name=="" || email=="" || mobile=="" || course=="" || level=="" || password=="" || city=="" )
            {
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Registration Failed All Feilds Are Compulsary to Fill!');");
                out.println("window.location.href = 'Registration.html';"); 
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            
            }
            else
            {    
            if (emailExists ) {
                
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Email ID already registered. Kindly register with another email ID.');");
                out.println("window.location.href = 'Registration.html';"); 
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                   
                String query2 = "INSERT INTO cj (name, email, mobile, course, level, password,city) VALUES ('" + name + "', '" + email + "', '" + mobile + "', '" + course + "', '" + level + "', '" + password + "','"+city+"')";
                i = st.executeUpdate(query2);
                
                   
            }
            }
            if (i > 0) {
                 out.println("<html>");
                out.println("<head></head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Registration Succesful. Kindly Login...!');");
                out.println("window.location.href = 'Login.html';"); 
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else if (!emailExists) {
                response.sendRedirect("RegistrationFail.html");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}