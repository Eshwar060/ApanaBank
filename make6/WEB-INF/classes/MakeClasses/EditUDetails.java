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


public class EditUDetails extends HttpServlet{
    
    //public void doGet(HttpServletRequest request,HttpServletResponse response) throws ClassNotFoundException, IOException
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            int AccountNumber = Integer.parseInt(request.getParameter("AccountNumber"));
            String strName=(String)request.getParameter("Name").toUpperCase();
            String strAddress=(String)request.getParameter("Address");
            String strMobile=(String)request.getParameter("Mobile");
            System.out.println(strName);
            System.out.println(strAddress);
            System.out.println(strMobile);
                final String USER = "root";
                final String PASS = "Wdykypcw$060";
                final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
                final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
                Connection conn=null;
                Statement statement=null;
                
               // Class.forName(JDBC_DRIVER);
                
                
                conn=DriverManager.getConnection(DB_URL, USER, PASS);
                statement =conn.createStatement();
                String string="UPDATE UAT SET NAME='"+strName+"',ADDRESS='"+strAddress+"',PHONE='"+strMobile+"' WHERE ID="+AccountNumber;
                if(statement.executeUpdate(string)==1)
                {
                    string="<br><br>Updated Successfully";
                }
                System.out.println(string);
                
                
                PrintWriter out = response.getWriter();
                out.print(string);
                
                statement.close();
                    conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(EditUDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}











/*
 * 
 * if(rs.next())
            {
            int dwBalance = rs.getInt("Balance");
            String strName= rs.getString("NAME");
            dwAmount=dwBalance+dwAmount;
            String query;
            query="UPDATE UAT SET BALANCE="+dwAmount+" WHERE ID="+dwAccontNo;
            if(statement.executeUpdate(query)==1)
            {
                ResultSet rs1 = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+dwAccontNo);
                rs1.next();
 */