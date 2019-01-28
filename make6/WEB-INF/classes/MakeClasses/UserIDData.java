package MakeClasses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserIDData extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        try {
            int AcNo = Integer.parseInt(request.getParameter("AccountNumber"));
            System.out.println("Get Account : "+AcNo);
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            Connection conn=null;
            Statement statement=null;
            try {
                Class.forName(JDBC_DRIVER);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserIDData.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            String string="";
            string="<thead class='thead'><th style=\"width:30px;\">ACCOUNT ID</th>"+"<th style=\"width:150px;\">NAME</th>"+"<th>BALANCE</th>"+"<th style=\"width:300px;\">ADDRESS</th>"+"<th>MOBILE</th></thead><tbody id='tbody3'>";
            ResultSet rs =statement.executeQuery("Select * from uat where ID="+AcNo);
            if(rs.next())
            {
                string+="<tr><td>"+rs.getInt("ID")+"</td><td>"+rs.getString("NAME")+"</td><td>"+rs.getString("BALANCE")+"</td><td>"+rs.getString("ADDRESS")+"</td><td>"+rs.getString("PHONE")+"</td></tr>";
            }
            else
            {
                string="not Found";
            }
            //System.out.println(string);
            
            string+="</tbody>";
            PrintWriter out = response.getWriter();
            out.print(string);
            
            statement.close();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserIDData.class.getName()).log(Level.SEVERE, null, ex);
            
            
        }
    }
}