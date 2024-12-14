/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mites
 */
public class Mobileupdate extends HttpServlet 
{

     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
      response.sendRedirect("Login.html");
   }
   
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
       response.setContentType("text/html");
       String oldnumber=request.getParameter("oldnumber");
       String newnumber=request.getParameter("newnumber");
       int i=0;
       PrintWriter out = response.getWriter();
        try
        {
            Statement st= DBConnector.getStatement(); 
            String query="Update cj SET mobile='"+newnumber+"' where mobile='"+oldnumber+"'"; 
            i=st.executeUpdate(query);
            
            if(i>0)
        {
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Updation Successful.');");
                out.println("window.location.href = 'Profile.jsp';"); 
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");    
        }
        else
        {
              response.sendRedirect("UpdationFail.jsp");
        } 
        }
        
        catch(SQLException e)
            {
               System.out.println(e);        
            }
       
            
   } 
}
