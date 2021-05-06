package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDAO {
    Connection connection;

    public LikeDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean insertLike(int post_id, int user_id) {
        boolean f = false;
        try{
            String q = "insert into liked(post_id,user_id)values(?,?)";
            PreparedStatement p = this.connection.prepareStatement(q);
            p.setInt(1,post_id);
            p.setInt(2,user_id);
            p.executeQuery();
            f = true;
        }  catch (Exception e) {
            e.printStackTrace();
        }
       return f;

}

        public int countLikeOnPost(int post_id) {
            int count = 0;
            String q = "select count(*) from like where post_id=?";
            try {
                PreparedStatement p = this.connection.prepareStatement(q);
                p.setInt(1, post_id);
                ResultSet set = p.executeQuery();
                if (set.next()) {
                    count = set.getInt("count(*)");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return count;
        }


        public boolean isLikedByUser(int post_id,int user_id){
         boolean f = false;
         try {
             PreparedStatement p = this.connection.prepareStatement("select from like where post_id=? and user_id=?");
             p.setInt(1, post_id);
             p.setInt(2, user_id);
             ResultSet set = p.executeQuery();
             if(set.next()) {
                 f = true;
             }
         } catch (Exception e) {
         }  return f;
        }

        public boolean deleteLike(int post_id, int user_id) {
        boolean f = false;
        try {
            PreparedStatement p = this.connection.prepareStatement
                    ("delete from like where post_id=? and user_id?");
            p.setInt(1, post_id);
            p.setInt(2, user_id);
            p.executeUpdate();
            f  = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
        }
}
