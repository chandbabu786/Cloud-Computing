/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.xensource.xenapi.Connection;
import com.xensource.xenapi.Session;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Garvit Patel
 */
public class Server_OAuth extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/HTML");
        PrintWriter out = response.getWriter();
        try {
            System.out.println("Server_OAuth Servlet Page");
            
            HttpSession session = request.getSession(true);
            String temp=request.getParameter("selectserver");
            if(temp.equals("server1"))
            {
                System.out.println("Server");
                session.setAttribute("uName","root");
                session.setAttribute("pass","xenserver");
                session.setAttribute("ip","http://11.0.0.3");
            }
            else if(temp.equals("server2"))
            {
                session.setAttribute("uName","root");
                session.setAttribute("pass","xenserver");
                session.setAttribute("ip","http://172.16.12.44");
            }
            else if(temp.equals("server3"))
            {
                session.setAttribute("uName","root");
                session.setAttribute("pass","xenserver");
                session.setAttribute("ip","http://172.16.12.42");
            }
            else if(temp.equals("server4"))
            {
                System.out.println("Server 4 called");
                session.setAttribute("uName","root");
                session.setAttribute("pass","system");
                session.setAttribute("ip","http://17.0.0.1");
            }
            else
            {
                
            }
            
            Connection C=new Connection(session.getAttribute("ip").toString(),session.getAttribute("uName").toString(),session.getAttribute("pass").toString());
            C.dispose();
            System.out.println("Connection created.........");
            response.sendRedirect("ChooseAction.html");
        } catch (Exception e) {
            request.getRequestDispatcher("Server_OAuth.html").include(request, response);
            System.out.println(e);
            out.print("<center style='color:red'>sorry,Ip,username or password error!</center>");
        }

    }
}
