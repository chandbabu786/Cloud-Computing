/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/HTML");
        HttpSession session=request.getSession();
       
        PrintWriter out = response.getWriter();
        String username = session.getAttribute("Email").toString();
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        //System.out.println(username + password);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded.....");
            Connection c = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/xenserver", "root", "");
            System.out.println("Connection Done....");
            Statement stmt = (Statement) c.createStatement();
            
            String sql = "INSERT INTO Login VALUES ('"+username+"','"+password+"')";
            if(password.equals(confirmpassword))
            {
                stmt.executeUpdate(sql);
                SendEmail.sendEmail(username);
                out.println("<script>alert('Sucessfully Registered');</script>");
                request.getRequestDispatcher("index.html").include(request, response);
                
            }
            else
            {
                out.println("<script>alert('Password Not confirmed');</script>");
                request.getRequestDispatcher("EnterPassword.html").include(request, response);
            }
            

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
