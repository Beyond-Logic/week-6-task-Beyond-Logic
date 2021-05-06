package controller;

import dao.LikeDAO;
import util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "LikeServlet", value = "/LikeServlet")
public class LikeServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try(PrintWriter out = response.getWriter()) {
            String operation = request.getParameter("operation");
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            int post_id = Integer.parseInt(request.getParameter("post_id"));

            LikeDAO likeDao = new LikeDAO(DBConnection.getInstance().getConnection());
            if (operation.equals("like")) {
                boolean f=likeDao.insertLike(post_id, user_id);
                out.println(f);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
