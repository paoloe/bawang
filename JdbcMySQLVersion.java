import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// Notice, do not import com.mysql.jdbc.*
// or you will have problems!

public class JdbcMySQLVersion {

    public static void main(String[] args) throws SQLException {
        try {
            //Class.forName("com.mysql.cj.jdbc.Driver").newInstance() ;
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cookbook", "root", "Kemperete123") ;
            Statement stmt = conn.createStatement() ;
            String query = "select * from Recipe WHERE name = \'Toad in the Hole\';" ;
            ResultSet rs = stmt.executeQuery(query) ;
            try {
                while ( rs.next() ) {
                    int numColumns = rs.getMetaData().getColumnCount();
                    for ( int i = 1 ; i <= numColumns ; i++ ) {
                       System.out.println( rs.getMetaData().getColumnLabel(i) + " = " + rs.getObject(i) );
                    }
                }
            } finally {
                try { rs.close(); } catch (Throwable ignore) { /* Propagate the original exception
        instead of this one that you may want just logged */ }
            }
        } catch (SQLException ex) {
            // TODO Auto-generated catch block
                // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }

    }
}