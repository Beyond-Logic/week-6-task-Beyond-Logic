<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Post"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.LikeDAO" %>
<%@ page import="util.DBConnection" %>
<%
    if (session == null || session.getAttribute("user_id") == null) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home | Social</title>
    <link rel="shortcut icon" href="image/logo.png">
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="http://localhost:8080/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@include file="header.jsp" %>



<div class="container">

    <div class="row welcome">
        <div class="col-lg-4">
            <div class="shadow p-3 mb-5 bg-body rounded text-center">
                <img class = "profile-pic-icon-three mt-4"
                     src="<%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getImage() %>" alt="Userphoto"/>
                <h5 class="mt-3">
                   <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/profile"><%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getFirst_name() + " " + new UserDAO().getUserById((int) session.getAttribute("user_id")).getLast_name() %></a>
                </h5>
            </div>
        </div>
        <div class="col-lg-8">

            <div class="shadow p-3 mb-5 bg-body rounded">

                <form action="home" method="post">
                            <div class="form-group">
                                <label for="post" style="color: #ffffff">Create Post</label>
                                <textarea name="post" class="form-control" id="post" rows="3" style ="resize: none" placeholder="What's on your mind @ <%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getFirst_name() + " " + new UserDAO().getUserById((int) session.getAttribute("user_id")).getLast_name() %>"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-md mt-3">Post</button>
                        </form>
            </div>
                <%
                    ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");

                    if(posts.size() == 0){
                %><h4 style="text-align: center; color: #ffffff;">No Posts.</h4><%
                }

                for(int i=0; i<posts.size(); i++){
            %>



                <div id="section-one" class="shadow p-3 mb-5 bg-body rounded">
                    <div class="row">

                        <div class="col-lg-1">
                            <img class="profile-pic-icon-two" src="<%= new UserDAO().getUserById(posts.get(i).getUser_id()).getImage() %>" />
                        </div>
                        <div class="col-lg-11">
                            <b><p class="">
                                <%
                                    if(posts.get(i).getUser_id() == (int) session.getAttribute("user_id")){
                                %><h5 class="postName"><%= new UserDAO().getUserById((int) session.getAttribute("user_id")).getFirst_name() + " " + new UserDAO().getUserById((int) session.getAttribute("user_id")).getLast_name() %></h5><%
                                } else{
                                %>
                                <h5 class=""> <%= new UserDAO().getUserById(posts.get(i).getUser_id()).getFirst_name() %> </h5>
                                <%
                                    }

                                %>
                                </p></b>

                            <h6 class="card-subtitle mb-2 text-muted"><%= posts.get(i).getBody() %></h6>
                            <p class="post-date"><%= posts.get(i).getPost_time() %></p>

                            <div class="">
                                <form>

                                    <div class="row">
                                        <div>
<%--                                            <hr>--%>
<%--                                            <p>Comment Goes Here</p>--%>
                                        </div>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control comment-form">
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="submit" class="btn btn-primary btn-sm btn-block">Comment</button>
                                        </div>

                                    </div>

                                </form>
                            </div>

                        </div>

                        <div class="row mt-3 text-center">
                            <div class="col-lg-6">
                                <div class="">

                                    <%
                                        LikeDAO ld = new LikeDAO(DBConnection.getInstance().getConnection());
                                    %>

                                    <a href="#!" onclick="doLike(<%= posts.get(i).getPost_id()%>,<%= new UserDAO().getUserById(posts.get(i).getUser_id())%>)" class="btn btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter">Like <%= ld.countLikeOnPost(posts.get(i).getPost_id())%></span>  </a>
                                    <a href="#!" class="btn btn-sm"> <i class="fa fa-commenting-o"></i> <span>Comment</span>  </a>

<%--                                    <button class="btn btn-light btn-sm" type="button"><span class="like-post">Like</span></button>--%>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="">
<%--                                    <button class="btn btn-light btn-sm" type="button"><span class="like-post">Unlike</span></button>--%>
                                </div>
                            </div>
                        </div>
                </div>

            </div>
            <%
                }
            %>
            </div>

</div>
</div>
<div class="container">
    <div class="row welcome">
        <nav aria-label="...">
            <ul class="pagination justify-content-end">
                <li class="page-item">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item" aria-current="page">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<footer class="text-center mt-5 mb-5">Java Book - 2021</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%--<script src="https://cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script>--%>
<script>
    CKEDITOR.replace('post');
</script>

<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
<script src="js/like.js" type="text/javascript"></script>
</body>
</html>
