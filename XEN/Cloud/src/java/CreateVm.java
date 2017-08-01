/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Statement;
import com.xensource.xenapi.Connection;
import com.xensource.xenapi.Host;
import com.xensource.xenapi.Pool;
import com.xensource.xenapi.Types;
import com.xensource.xenapi.VM;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.xmlrpc.XmlRpcException;


public class CreateVm extends HttpServlet {
    static Connection connection;
    static HttpSession session ;
    String Uuid;
    Statement stmt;
    @Override  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/HTML");
            PrintWriter out = response.getWriter();
            session= request.getSession(true);
           // long CPU = Long.parseLong(request.getParameter("CPU"));
            String namevm = request.getParameter("namevm");
            String OS = request.getParameter("OS");
            //long RAM = Long.parseLong(request.getParameter("RAM"));
            //long HDD = Long.parseLong(request.getParameter("HDD"));
            Class.forName("com.mysql.jdbc.Driver");
            com.mysql.jdbc.Connection c = (com.mysql.jdbc.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/xenserver", "root", "");
            stmt = (Statement) c.createStatement();
            
            
            try {
                createVm(namevm,OS);
                out.println("<script>alert('Vm created Sucessfully');</script>");
                request.getRequestDispatcher("ChooseAction.html").include(request, response);
            } catch (Exception ex) {
                Logger.getLogger(CreateVm.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateVm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CreateVm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createVm(String namevm, String OS) throws MalformedURLException, XmlRpcException, Types.SessionAuthenticationFailed, Types.XenAPIException, Exception {

      
        connection = new Connection(session.getAttribute("ip").toString(),session.getAttribute("uName").toString(),session.getAttribute("pass").toString());
       String templateName;
        if(OS.equals("w"))
       {
             templateName = "AH";
       }
       else if(OS.equals("u"))
        {
             templateName = "UB";
        }
       else
       {
             templateName = "MAC";
       }
        String instanceName = namevm;
        VM template = VM.getByNameLabel(connection, templateName).iterator().next();
        System.out.println("complete 1");
        VM vm = template.createClone(connection, instanceName);
        System.out.println("complete 2");
        vm.setNameLabel(connection, instanceName);
        vm.setMemoryStaticMin(connection, 1073741824L);
        vm.setMemoryDynamicMin(connection, 1073741824L);
        vm.setMemoryDynamicMax(connection, 1073741824L);
        vm.setMemoryStaticMax(connection, 1073741824L);
        vm.setVCPUsAtStartup(connection, 1L);
        System.out.println("complete 3");
        VM newVm = VM.getByNameLabel(connection, instanceName).iterator().next();
        System.out.println("complete 4");
        newVm.provision(connection);
        newVm.start(connection, false, false);
        newVm.hardShutdown(connection);
        Uuid=newVm.getUuid(connection);
        String sql = "INSERT INTO vmdata VALUES ('"+session.getAttribute("uname").toString()+"','"+Uuid+"')";
        stmt.executeUpdate(sql);
        connection.dispose();
        
    }
    protected static void checkMasterHvmCapable() throws Exception
    {
        
        Pool pool = (Pool) Pool.getAll(connection).toArray()[0];
        Host master = pool.getMaster(connection);
        Set<String> capabilities = master.getCapabilities(connection);

        Boolean hvmCapable = false;
        for (String s: capabilities)
            if (s.contains("hvm")) {
                hvmCapable = true;
                break;
            }
        if (!hvmCapable)
            throw new Exception("Master has no hvm capabilities!");
    }
}
