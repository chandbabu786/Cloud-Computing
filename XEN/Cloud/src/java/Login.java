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
import java.sql.ResultSet;
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
 * @author Garvit Patel
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/HTML");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("uname");
        String password = request.getParameter("password");
        System.out.println(username + password);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded.....");
            Connection c = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/xenserver", "root", "");
            System.out.println("Connection Done....");
            Statement stmt = (Statement) c.createStatement();
//            String sql = "INSERT INTO Login VALUES ('"+username+"','"+password+"')";
//            stmt.executeUpdate(sql);
            String sql = "select * from Login";
            ResultSet rs = stmt.executeQuery(sql);
            int flag=0;
            //response.sendRedirect("Server_OAuth.html");
            while (rs.next()){
                if ((rs.getString("Username")).equals(username) &&(rs.getString("Password")).equals(password) ) {
                    out.println("Username:" + rs.getString("Username") + "Password:" + rs.getString("Password"));
                    out.println("Sucessfully Logged in..............");
                    HttpSession session=request.getSession();
                    session.setAttribute("uname",username);
                    response.sendRedirect("Server_OAuth.html");
                    flag++;
                } 
            }
            if(flag==0){
                    request.getRequestDispatcher("index.html").include(request, response);
                    out.print("<center style='color:red'>sorry, username or password error!</center>");
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
