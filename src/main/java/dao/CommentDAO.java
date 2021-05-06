//package dao;
//
//import util.DBConnection;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//public class CommentDAO {
//    public void insertComment(int user_id, int post_id, String body) throws SQLException {
//        Connection conn = DBConnection.getInstance().getConnection();
//        PreparedStatement st = conn.prepareStatement("INSERT INTO comment (comment_id, user_id, post_id, body) VALUES (?,?,?,?);");
//        st.setInt(1, user_id);
//        st.setInt(2,post_id);
//        st.setString(4, body);
//        st.executeUpdate();
//    }
//}
