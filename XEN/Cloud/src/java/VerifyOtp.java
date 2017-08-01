/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class VerifyOtp extends HttpServlet {

    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/HTML");
        PrintWriter out = response.getWriter();
        String otp = request.getParameter("OTP");
        HttpSession session=request.getSession();
        if(otp.equals(session.getAttribute("OTP").toString()))
        {
            out.println("<script>alert('Email Verified');</script>");
            request.getRequestDispatcher("EnterPassword.html").include(request, response);
        }
        else{
            out.println("<script>alert('Invalid Verification code. Please Try again');</script>");
            request.getRequestDispatcher("EnterOtp.html").include(request, response);
        }
        
    }

}
