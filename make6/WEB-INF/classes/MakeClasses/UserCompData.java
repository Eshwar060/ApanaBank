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

public class UserCompData extends HttpServlet{
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
            int hits=0;
            try {
                Class.forName(JDBC_DRIVER);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserCompData.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            String string="";
            string="<thead class='thead'><th  style=\"width:30px;\">ACCOUNT ID</th>"+"<th style=\"width:150px;\">NAME</th>"+"<th>BALANCE</th>"+"<th>ADDRESS</th>"+"<th>MOBILE</th>"+"<th>Edit</th></thead><tbody>";
            ResultSet rs =statement.executeQuery("Select * from uat");
            System.out.println("Complete Data ReQ ::");
            String click;
            while(rs.next())
            {
                string+="<tr  class='trow' id='"+rs.getInt("ID")+"'>"+
                            "<td>"+rs.getInt("ID")+"</td>"+
                            "<td>"+rs.getString("NAME")+"</td>"+
                            "<td>"+rs.getString("BALANCE")+"</td>"+
                            "<td>"+rs.getString("ADDRESS")+"</td>"+
                            "<td>"+rs.getString("PHONE")+"</td>"+
                            "<td>"+"<button  class='button' onclick='getEdit("+rs.getInt("ID")+")' title='Get User Details'>Get</button>"+"</td>"+
                        "</tr>";
                ++hits; 
            }
            string+="</tbody>";
            //System.out.println(string);
            //System.out.println("\n\n\n\n");
            PrintWriter out = response.getWriter();
            /*String Str = new String("Welcome-to-Tutorialspoint.com");
            System.out.println("Return Value :" );
            for (String retval: Str.split("-", 2)){
            System.out.println(retval);
            System.out.println("\n\n\n\n");
            }*/
            out.print(string);
            statement.close();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserCompData.class.getName()).log(Level.SEVERE, null, ex);
            
            
        }
    }
}