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

public class Sample extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        try {
            String name = (String)request.getParameter("vname");
            String comment=(String)request.getParameter("comment");
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            Connection conn=null;
            Statement statement=null;
            try {
                Class.forName(JDBC_DRIVER);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Sample.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            
            statement.executeUpdate("insert into Comments values('"+name+"','"+comment+"','EMPTY TEM')");
            String string="Ok Comment Sent";
            
            PrintWriter out = response.getWriter();
            out.print(string);
            statement.close();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Sample.class.getName()).log(Level.SEVERE, null, ex);
            
            
        }
    }
}