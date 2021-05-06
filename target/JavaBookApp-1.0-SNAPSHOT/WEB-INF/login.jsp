<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Java Book - Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="http://localhost:8080/css/style.css">
    <title>Login</title>

</head>

<body>
<div class="container mt-5">
    <div class="row welcome">
        <div class="col-lg-7">

            <img src="" alt="">
            <h1 class="logo">JAVA Book</h1>
            <h2 class="JavaFacebook mb-5">JAVA Book helps you connect and share <br> with Java Programmers.</h2>
        </div>
        <div class="col-lg-5">
            <div class="shadow p-3 mb-5 bg-body rounded">
                <div class="login-wrap">
                    <div class="login-html">
                        <input id="tab-1" type="radio" name="tab" class="sign-in"
                               <%
							if(request.getAttribute("page") != null){
								if(request.getAttribute("page").equals("login")){
									%>checked<%
								}
							} else{
								%>checked<%
							}
						%> ><label
                            for="tab-1" class="tab btn btn-primary">Log In</label> <input id="tab-2"
                                                                           type="radio" name="tab" class="sign-up" <%
							if(request.getAttribute("page") != null){
								if(request.getAttribute("page").equals("register")){
									%>checked<%
								}
							}
						%>><label for="tab-2" class="tab btn btn-success">Create New Account</label>
                        <div class="login-form">
                            <div class="sign-in-htm">
                                <form method="post" action="${pageContext.request.contextPath}/login">
                                    <div class="group mt-5">
                                        <%--@declare id="user"--%><label for="user" class="label"></label>
                                            <input id="email" name="email" type="text" class="input" placeholder="Email Address">
                                    </div>
                                    <div class="group">
                                        <%--@declare id="pass"--%><label for="pass" class="label"></label> <input
                                            type="password" id="password" name="password" class="input" placeholder="Password" data-type="password">
                                    </div>
                                    <div class="group">
                                        <input id="check" type="checkbox" class="check" checked>
                                        <label for="check"><span class="icon"></span> Keep me
                                            Signed in</label>
                                    </div>
                                    <div class="group">
                                        <input type="submit" class="button" value="Sign In">
                                    </div>
                                    <%
                                        if(request.getAttribute("msg") != null){
                                    %>
                                    <p><%=request.getAttribute("msg")%><p>
                                        <%
							}
						%>
                                    <div class="hr"></div>

                                </form>
                            </div>
                            <div class="sign-up-htm">
                                <form method="post" action="${pageContext.request.contextPath}/register">
                                    <div class="group mt-5">
                                        <label for="user" class="label"><%
                                            if(request.getAttribute("fmsg") != null){
                                        %>
                                            <span style="float:right;"><%=request.getAttribute("fmsg")%></span>
                                            <%
                                                }
                                            %></label>
                                        <input id="first_name" name="first_name" type="text" class="input form-control" placeholder="First Name ">

                                    </div>
                                    <div class="group">
                                        <label for="user" class="label"><%
                                            if(request.getAttribute("lmsg") != null){
                                        %>
                                            <span style="float:right;"><%=request.getAttribute("lmsg")%></span>
                                            <%
                                                }
                                            %>
                                        </label>
                                        <input id="last_name" name="last_name" type="text" class="input form-control" placeholder="Last Name">

                                    </div>
                                    <div class="group">
                                        <label for="pass" class="label">
                                            <%
                                                if(request.getAttribute("emsg") != null){
                                            %>
                                            <span style="float:right;"><%=request.getAttribute("emsg")%></span>
                                            <%
                                                }
                                            %></label>
                                        <input id="email" name="email" type="text" class="input form-control" placeholder="Email">

                                    </div>
                                    <div class="group">
                                        <label for="pass" class="label">
                                            <%
                                                if(request.getAttribute("pmsg") != null){
                                            %>
                                            <span style="float:right;"><%=request.getAttribute("pmsg")%></span>
                                            <%
                                                }
                                            %></label>
                                        <input id="password" name="password" type="password" class="input form-control" data-type="password" placeholder="Password">

                                    </div>
                                    <div class="group">
                                        <label for="pass" class="label">
                                            <%
                                                if(request.getAttribute("cpmsg") != null){
                                            %>
                                            <span style="float:right;"><%=request.getAttribute("cpmsg")%></span>
                                            <%
                                                }
                                            %>
                                        </label>
                                        <input id="cpassword" name="cpassword" type="password" class="input form-control" data-type="password" placeholder="Confirm Password">

                                    </div>
                                    <div class="group">
                                        <input type="submit" class="button btn btn-green btn-lg mt-3 mb-3" value="Sign Up">
                                    </div>
                                    <%
                                        if(request.getAttribute("rmsg") != null){
                                    %>
                                    <p><%=request.getAttribute("rmsg")%><p>
                                        <%
								}
							%>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</div>

</body>