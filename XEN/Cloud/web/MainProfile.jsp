<%-- 
    Document   : MainProfile
    Created on : Nov 10, 2016, 2:03:02 PM
    Author     : Garvit Patel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Navigationbar.css">
        <link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/Editor.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <title>Profile | CodeVilla</title>
        <%
            response.setContentType("text/html");
            String user = (String) session.getAttribute("user");
            HttpSession session1 = request.getSession();
            if (session1.isNew()) {
                out.print("<script>"
                        + "window.location.replace('http://localhost:8080/ABC/Logout');"
                        + "</script>");

            } else {
//                
            }
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (Exception e) {
            }


        %>
    </head>
    <body>
        <%  java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            Statement SS = C1.createStatement();
            String quer;
            String quer1;
            ResultSet rs;
        %>
        <a id="myPage" ></a>
        <div class="container-fluid" style="padding-top:70px;overflow-x: hidden;padding-left: 0px;padding-right: 0px;">

            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-default navbar-fixed-top" style="border-color: rgba(231, 231, 231, 0.45)!important;">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>                        
                                </button>

                                <a class="navbar-brand" style="padding: 0px" href="AboutUs.html">
                                    <img alt="Company Logo" src="images/cv_logo.png" style="margin-left: 20px;margin-top: 5px;height: 40px;width: 40px;float: left;">
                                    <span class="cmpyname" style="margin-left: 5px;color: white;font-size: 30px;line-height: 47px;">CodeVilla</span>
                                </a>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav navbar-right navi">
                                    <li ><a href="MainEvent.jsp">EVENTS</a></li>
                                    <li ><a href="MainEditor.html">EDITOR</a></li>
                                    <li class="active activeself"><a href="Profile.jsp">PROFILE</a></li>
                                    <li><a href="Logout">LOGOUT</a></li> 
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row edi" >

                <form name="vinform" method="GET" style="margin-left: 12%;margin-right: 10%;width:85%">

                    <div class="row" style="clear: left">

                        <div class="col-sm-11 editor">
                            <div class="pan-head">
                                Personal Details
                            </div>
                            <div class="pan-body">
                                <form class="form">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-sm-2"><label for="fname">First Name:</label></div>
                                            <div class="col-sm-8"><input class="form-control" type="text" id="fn" name="fname" value='<%=session.getAttribute("fname")%>' disabled/></div>
                                            <div class="col-sm-2 edit"><button class="btn btn-info" type="button" id="b1" >Edit</button></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2"><label for="lname">Last Name:</label></div>
                                            <div class="col-sm-8"><input class="form-control" type="text" id="ln" name="lname" value='<%=session.getAttribute("lname")%>' disabled/> </div>
                                            <div class="col-sm-2 edit"><button class="btn btn-info" type="button" id="b2" >Edit</button></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2"><label for="user">UserName:</label></div>
                                            <div class="col-sm-8"><input class="form-control" type="email" id="us" name="user" value='<%=session.getAttribute("user")%>' disabled/></div>
                                            <div class="col-sm-2 edit"><button class="btn btn-info" type="button" id="b3" >Edit</button></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2"><label for="pass">Password:</label></div>
                                            <div class="col-sm-8"><input class="form-control" type="password" id="pa" name="pass" value='<%=session.getAttribute("pass")%>' disabled/></div>
                                            <div class="col-sm-2 edit"><button class="btn btn-info" type="button" id="b4" >Edit</button></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2"><label for="phno" >Ph.Number:</label></div>
                                            <div class="col-sm-8"><input class="form-control" type="text" id="pn" name="phno" value='<%=session.getAttribute("phno")%>' disabled/></div>
                                            <div class="col-sm-2 edit"><button class="btn btn-info" type="button" id="b5" >Edit</button></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2" ><label for="add">Address:</label></div>
                                            <div class="col-sm-8"><input class="form-control" type="text" id="ad" name="add" value='<%=session.getAttribute("add")%>' disabled/></div>
                                            <div class="col-sm-2 edit"><button class="btn btn-info" type="button" id="b6" >Edit</button></div>
                                        </div>
                                    </div>
                                    <div class="save">
                                        <button id="s1" class="btn btn-info" type="button" style="display: none">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row edi" style="margin-top: 2%;margin-bottom: 2%">

                <form name="vinform" method="GET" style="margin-left: 12%;margin-right: 10%;width:85%">

                    <div class="row" style="clear: left">

                        <div class="col-sm-11 editor">
                            <div class="pan-head">
                                Education
                            </div>
                            <div class="pan-body">
                                <div id="EDU" class="row addprof">
                                    <ul id="eduul">
                                        <%
                                            quer = "select * from education where User_Name='" + user + "';";
                                            rs = SS.executeQuery(quer);
                                            while (rs.next()) {
                                                String ans = rs.getString("edu");
                                                out.print("<li id='" + ans + "' >"
                                                        + ans
                                                        + "</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div id="addedu" class="addprof row">
                                    <form class="form" method="get" id="eduform" >
                                        <div class="col-sm-3"><input class="form-control" type="text" id="edu" placeholder="Add" required/></div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="addb1" >Add</button></div>

                                    </form>
                                </div>
                                <div id="remedu" class="addprof row">
                                    <form class="form" method="get">
                                        <div class="col-sm-3"><select class="form-control" id="edusec">
                                                <%
                                                    quer = "select * from education where User_Name='" + user + "';";
                                                    rs = SS.executeQuery(quer);
                                                    while (rs.next()) {
                                                        String ans = rs.getString("edu");
                                                        out.print("<option class='form-control' value='" + ans + "' >"
                                                                + ans
                                                                + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="remb1">Remove</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>



            <div class="row edi" style="margin-top: 2%;margin-bottom: 2%">

                <div name="vinform" method="GET" style="margin-left: 12%;margin-right: 10%;width:85%">


                    <div class="row" style="clear: left">

                        <div class="col-sm-11 editor">
                            <div class="pan-head">
                                Programming Languages
                            </div>
                            <div class="pan-body">
                                <div id="LAN" class="row addprof">
                                    <ul id="lanul">
                                        <%
                                            quer = "select * from language where User_Name='" + user + "';";
                                            rs = SS.executeQuery(quer);
                                            while (rs.next()) {
                                                String ans = rs.getString("lan");
                                                out.print("<li id='" + ans + "' >"
                                                        + ans
                                                        + "</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div id="addlan"  class="addprof row">
                                    <form class="form" method="get" id="lanform" >
                                        <div class="col-sm-3"><input class="form-control" type="text" id="lan" placeholder="Add" required/></div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="addb2" >Add</button></div>
                                    </form>
                                </div>
                                <div id="remlan" class="addprof row">
                                    <form class="form" method="get">
                                        <div class="col-sm-3">
                                            <select class="form-control" id="lansec">
                                                <%
                                                    quer = "select * from language where User_Name='" + user + "';";
                                                    rs = SS.executeQuery(quer);
                                                    while (rs.next()) {
                                                        String ans = rs.getString("lan");
                                                        out.print("<option value='" + ans + "' >"
                                                                + ans
                                                                + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="remb2">Remove</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row edi" style="margin-top: 2%;margin-bottom: 2%">

                <div name="vinform" method="GET" style="margin-left: 12%;margin-right: 10%;width:85%">

                    <div class="row" style="clear: left">

                        <div class="col-sm-11 editor">
                            <div class="pan-head">
                                Frameworks
                            </div>
                            <div class="pan-body">
                                <div id="FRA" class="row addprof">
                                    <ul id="fraul">
                                        <%
                                            quer = "select * from framework where User_Name='" + user + "';";
                                            rs = SS.executeQuery(quer);
                                            while (rs.next()) {
                                                String ans = rs.getString("fra");
                                                out.print("<li id='" + ans + "' >"
                                                        + ans
                                                        + "</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div id="addfra"  class="addprof row">
                                    <form class="form" method="get" id="fraform" >
                                        <div class="col-sm-3"><input class="form-control" type="text" id="fra" placeholder="Add" required/></div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="addb3" >Add</button></div>
                                    </form>
                                </div>
                                <div id="remfra" class="addprof row">
                                    <form class="form" method="get">
                                        <div class="col-sm-3">
                                            <select class="form-control" id="frasec">
                                                <%
                                                    quer = "select * from framework where User_Name='" + user + "';";
                                                    rs = SS.executeQuery(quer);
                                                    while (rs.next()) {
                                                        String ans = rs.getString("fra");
                                                        out.print("<option value='" + ans + "' >"
                                                                + ans
                                                                + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="remb3">Remove</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row edi" style="margin-top: 2%;margin-bottom: 2%">

                <div name="vinform" method="GET" style="margin-left: 12%;margin-right: 10%;width:85%">

                    <div class="row" style="clear: left">

                        <div class="col-sm-11 editor">
                            <div class="pan-head">
                                Projects
                            </div>
                            <div class="pan-body">
                                <div id="PROJ" class="row addprof">
                                    <ul id="projul">
                                        <%
                                            quer = "select * from project where User_Name='" + user + "';";
                                            rs = SS.executeQuery(quer);
                                            while (rs.next()) {
                                                String ans = rs.getString("proj");
                                                out.print("<li id='" + ans + "' >"
                                                        + ans
                                                        + "</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div id="addproj"  class="addprof row">
                                    <form class="form" method="get" id="projform" >
                                        <div class="col-sm-3"><input class="form-control" type="text" id="proj" placeholder="Add" required/></div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="addb4" >Add</button></div>
                                    </form>
                                </div>
                                <div id="remproj" class="addprof row">
                                    <form class="form" method="get">
                                        <div class="col-sm-3">
                                            <select class="form-control" id="projsec">
                                                <%
                                                    quer = "select * from project where User_Name='" + user + "';";
                                                    rs = SS.executeQuery(quer);
                                                    while (rs.next()) {
                                                        String ans = rs.getString("proj");
                                                        out.print("<option value='" + ans + "' >"
                                                                + ans
                                                                + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="remb4">Remove</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row edi" style="margin-top: 2%;margin-bottom: 2%">

                <div name="vinform" method="GET" style="margin-left: 12%;margin-right: 10%;width:85%">

                    <div class="row" style="clear: left">

                        <div class="col-sm-11 editor">
                            <div class="pan-head">
                                Achievements
                            </div>
                            <div class="pan-body">
                                <div id="ACH" class="row addprof">
                                    <ul id="achul">
                                        <%
                                            quer = "select * from achivement where User_Name='" + user + "';";
                                            rs = SS.executeQuery(quer);
                                            while (rs.next()) {
                                                String ans = rs.getString("ach");
                                                out.print("<li id='" + ans + "' >"
                                                        + ans
                                                        + "</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div id="addach"  class="addprof row">
                                    <form class="form" method="get" id="projform" >
                                        <div class="col-sm-3"><input class="form-control" type="text" id="ach" placeholder="Add" required/></div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="addb6" >Add</button></div>
                                    </form>
                                </div>
                                <div id="remach" class="addprof row">
                                    <form class="form" method="get">
                                        <div class="col-sm-3">
                                            <select class="form-control" id="achsec">
                                                <%
                                                    quer = "select * from achivement where User_Name='" + user + "';";
                                                    rs = SS.executeQuery(quer);
                                                    while (rs.next()) {
                                                        String ans = rs.getString("ach");
                                                        out.print("<option value='" + ans + "' >"
                                                                + ans
                                                                + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-9"><button class="btn btn-info" type="button" id="rem6">Remove</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#remb1').click(function () {

                var edu = document.getElementById("edusec").value;
                $("#edusec").val('');
                if (edu !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 1)
                            {
                                $("#edusec option[value='" + edu + "']").remove();
                                $("#" + edu).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(edu);
                    xmlhttp.open("GET", "remprof?unicode=1&edu=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb2').click(function () {

                var lan = document.getElementById("lansec").value;
                $("#lansec").val('');
                if (lan !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 2)
                            {
                                $("#lansec option[value='" + lan + "']").remove();
                                $("#" + lan).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(lan);
                    xmlhttp.open("GET", "remprof?unicode=2&lan=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb3').click(function () {

                var fra = document.getElementById("frasec").value;
                $("#frasec").val('');
                if (fra !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 3)
                            {
                                $("#frasec option[value='" + fra + "']").remove();
                                $("#" + fra).remove();
                            }
                            else
                            {
                            }
                        }
                    };
                    var uri = encodeURIComponent(fra);
                    xmlhttp.open("GET", "remprof?unicode=3&fra=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb4').click(function () {

                var proj = document.getElementById("projsec").value;
                $("#projsec").val('');
                if (proj !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 4)
                            {
                                $("#projsec option[value='" + proj + "']").remove();
                                $("#" + proj).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(proj);
                    xmlhttp.open("GET", "remprof?unicode=4&proj=" + uri, true);
                    xmlhttp.send();
                }
            });
            
            $('#remb6').click(function () {

                var ach = document.getElementById("achsec").value;
                $("#achsec").val('');
                if (ach !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 6)
                            {
                                $("#achsec option[value='" + ach + "']").remove();
                                $("#" + ach).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(ach);
                    xmlhttp.open("GET", "remprof?unicode=6&ach=" + uri, true);
                    xmlhttp.send();
                }
            });
        </script>
        <script>
            $("#prospects_form").submit(function (e) {
                e.preventDefault();
            });

            $('#addb1').click(function () {

                var edu = document.getElementById("edu").value;
                $("#edu").val('');
                if (edu !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 1)
                            {
                                $('#eduul').append("<li id='" + edu + "' >" + edu + "</li>");
                                $('#edusec').append("<option value='" + edu + "' >" + edu + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(edu);
                    xmlhttp.open("GET", "Profile1?unicode=1&edu=" + uri, true);
                    xmlhttp.send();
                }

            });
            $('#addb2').click(function () {

                var lan = document.getElementById("lan").value;
                $("#lan").val('');
                if (lan !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 2)
                            {
                                $('#lanul').append("<li id='" + lan + "' >" + lan + "</li>");
                                $('#lansec').append("<option value='" + lan + "' >" + lan + "</option>");
                            } else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(lan);
                    xmlhttp.open("GET", "Profile1?unicode=2&lan=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb3').click(function () {
                var fra = document.getElementById("fra").value;
                $("#fra").val('');
                if (fra !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 3)
                            {
                                $('#fraul').append("<li id='" + fra + "' >" + fra + "</li>");
                                $('#frasec').append("<option value='" + fra + "' >" + fra + "</option>");
                            } else
                            {
                            }
                        }
                    };
                    var uri = encodeURIComponent(fra);
                    xmlhttp.open("GET", "Profile1?unicode=3&fra=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb4').click(function () {
                var proj = document.getElementById("proj").value;
                $("#proj").val('');
                if (proj !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 4)
                            {
                                $('#projul').append("<li id='" + proj + "' >" + proj + "</li>");
                                $('#projsec').append("<option value='" + proj + "' >" + proj + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(proj);
                    xmlhttp.open("GET", "Profile1?unicode=4&proj=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb6').click(function () {
                var ach = document.getElementById("ach").value;
                $("#ach").val('');
                if (ach !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 6)
                            {
                                $('#achul').append("<li id='" + ach + "' >" + ach + "</li>");
                                $('#achsec').append("<option value='" + ach + "' >" + ach + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(ach);
                    xmlhttp.open("GET", "Profile1?unicode=6&ach=" + uri, true);
                    xmlhttp.send();
                }
            });
        </script>
        <script>
            $('#b1').click(function () {
                $("#s1").show();
                //$("#s1").prop("style", "display:button");
                $('#fn').prop("disabled", false);
            });
            $('#s1').click(function () {
                $("#s1").prop("style", "display:none");
                $('#fn').prop("disabled", true);
                $('#ln').prop("disabled", true);
                $('#us').prop("disabled", true);
                $('#pa').prop("disabled", true);
                $('#pn').prop("disabled", true);
                $('#ad').prop("disabled", true);
                var fname = document.getElementById("fn").value;
                var lname = document.getElementById("ln").value;
                var user = document.getElementById("us").value;
                var pass = document.getElementById("pa").value;
                var phno = document.getElementById("pn").value;
                var add = document.getElementById("ad").value;
                var xmlhttp = new XMLHttpRequest();
                var uri1 = encodeURIComponent(fname);
                var uri2 = encodeURIComponent(lname);
                var uri3 = encodeURIComponent(user);
                var uri4 = encodeURIComponent(pass);
                var uri5 = encodeURIComponent(phno);
                var uri6 = encodeURIComponent(add);
                xmlhttp.open("GET", "Profile?fname=" + uri1 + "&lname=" + uri2 + "&user=" + uri3 + "&pass=" + uri4 + "&phno=" + uri5 + "&add=" + uri6, true);
                xmlhttp.send();
            });
            $('#b2').click(function () {
                $("#s1").show();
                $('#ln').prop("disabled", false);
            });
            $('#b3').click(function () {
                $("#s1").show();
                $('#us').prop("disabled", false);
            });
            $('#b4').click(function () {
                $("#s1").show();
                $('#pa').prop("disabled", false);
            });
            $('#b5').click(function () {
                $("#s1").show();
                $('#pn').prop("disabled", false);
            });
            $('#b6').click(function () {
                $("#s1").show();
                $('#ad').prop("disabled", false);
            });
        </script>
    </body>
</html>
