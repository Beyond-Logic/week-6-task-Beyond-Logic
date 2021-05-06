<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO"%>
<header>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="http://localhost:8080/css/style.css">
        <nav class="navbar mb-5 navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home"><b class="javabook">Java</b> Book</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    </ul>

                    <div class="d-flex">
<%--                        <img class="profile-pic-icon mt-2" src="" alt="">--%>
                        <img class = "profile-pic-icon mt-2"
                             src="<%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getImage() %>" />

                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/profile"><%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getFirst_name() + " " + new UserDAO().getUserById((int) session.getAttribute("user_id")).getLast_name() %></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/message">Message</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/logout">Logout</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </div>
        </nav>
</header>
