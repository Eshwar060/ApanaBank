package MakeClasses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminDelete extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            int AccountNumber = Integer.parseInt(request.getParameter("AccountNumber"));
                final String USER = "root";
            	final String PASS = "Wdykypcw$060";
            	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            	final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
                Connection conn=null;
                Statement statement=null;
                
               // Class.forName(JDBC_DRIVER);
                
                
                conn=DriverManager.getConnection(DB_URL, USER, PASS);
                statement =conn.createStatement();
                String string="DELETE FROM uat WHERE ID="+AccountNumber;
                if(statement.executeUpdate(string)==1)
                    string="<br><br>User Deleted";
				else
					string="<br><br>Unable to perform operation";
                PrintWriter out = response.getWriter();
                out.print(string);
                
                statement.close();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDelete.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}