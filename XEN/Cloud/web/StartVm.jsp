<%-- 
    Document   : StartVm
    Created on : Feb 28, 2017, 12:52:14 AM
    Author     : Garvit Patel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Set"%>
<%@page import="com.xensource.xenapi.VM"%>
<%@page import="com.xensource.xenapi.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>CHARUSAT Cloud</title>
        <meta charset="UTF-8">
        <script src="jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <center>
        <div style="border: 1px solid black;width:50%">
            <h2>START VM</h2>
            <form method="post" id="form">
                <select id="selectos"></select><br>
                <input type="button" id="svm" name="Start Vm" value="Start Vm" style="margin:5px"><br>
                <input type="button" id="rvm" name="Restart Vm" value="Restart Vm" style="margin:5px"><br>
                <input type="button" id="fsvm" name="Shutdown Vm" value="Shutdown Vm" style="margin:5px"><br>
                <input type="button" id="tsvm" name="Terminate Vm" value="Terminate Vm" style="margin:5px">
            </form>
        </div>
    </center>
    <script>
        <%
            Connection C = new Connection(session.getAttribute("ip").toString(), session.getAttribute("uName").toString(), session.getAttribute("pass").toString());

            Set<VM> s = VM.getAll(C);
            String S = "";
            String Uuid = "";
            for (VM v : s) {
                try {
                    if (!v.getIsATemplate(C)) {
                        if ((v.getNameLabel(C)).contains("Control")) {
                            continue;
                        }
                        S += v.getNameLabel(C) + ",";
                        Uuid += v.getUuid(C) + ",";
                    }
                } catch (Exception E) {

                }
            }
            String os = S;
            String UUID = Uuid;
            C.dispose();

            Class.forName("com.mysql.jdbc.Driver");
            com.mysql.jdbc.Connection c = (com.mysql.jdbc.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/xenserver", "root", "");
            Statement stmt = (Statement) c.createStatement();
            String sql = "select * from vmdata where Username='" + session.getAttribute("uname") + "';";
            ResultSet rs = stmt.executeQuery(sql);
            String uuidlist = "";
            while (rs.next()) {
                uuidlist += rs.getString("UUID") + ",";
            }
        %>
        var stros = '<%=os%>';
        var strUUID = '<%=UUID%>';
        var strUUIDLIST = '<%=uuidlist%>';
        var UUIDLIST = strUUIDLIST.split(",");
        var UUID = strUUID.split(",");
        var os = stros.split(',');
        var oslength = os.length;
        var uuidlistlength = UUIDLIST.length;
        var j = 0;
        for (j = 0; j < uuidlistlength - 1; j++)
        {

            var found = false;
            for (var i = 0; i < os.length-1; i++) {
                
                if (UUID[i] === UUIDLIST[j]) {
                    found = true;
                    //alert(UUID[i]);
                    $('#selectos').append("<option value='" + os[i] + "'>" + os[i] + "</option>");
                    break;
                }
            }
            //$('#selectos').append("<option value='" + os[i] + "'>" + os[i] + "</option>");
        }
        $('#svm').click(function() {
            var selectos = document.getElementById('selectos').value;
            var xhttp = new XMLHttpRequest();

            xhttp.open("GET", "StartVm?selectos=" + selectos + "&butt=svm", true);
            xhttp.send();
        });
        $('#rvm').click(function() {
            var selectos = document.getElementById("selectos").value;
            var xhttp = new XMLHttpRequest();

            xhttp.open("GET", "StartVm?selectos=" + selectos + "&butt=rvm", true);
            xhttp.send();
        });
        $('#fsvm').click(function() {
            var selectos = document.getElementById('selectos').value;
            var xhttp = new XMLHttpRequest();

            xhttp.open("GET", "StartVm?selectos=" + selectos + "&butt=fsvm", true);
            xhttp.send();
        });
        $('#tsvm').click(function() {
            var selectos = document.getElementById('selectos').value;
            var xhttp = new XMLHttpRequest();

            xhttp.open("GET", "StartVm?selectos=" + selectos + "&butt=tsvm", true);
            xhttp.send();
        });
    </script>
</body>
</html>
