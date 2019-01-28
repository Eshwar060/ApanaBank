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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminWithdraw extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            
            int AccountNumber = Integer.parseInt(request.getParameter("AccountNumber"));
            int Amount=Integer.parseInt(request.getParameter("Amount"));
            
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            Connection conn=null;
            Statement statement=null;
            
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+AccountNumber);
            rs.next();
            int dwBalance = rs.getInt("Balance");
            String string;
            if(dwBalance<Amount)
            {
                string="<br><br>Balance :Rs."+dwBalance+"<br><img src=\"ebWarning.jpg\"> !Insufficient Balance";    
            }
            else
            {
                Amount=dwBalance-Amount;
                String query;
                query="UPDATE UAT SET BALANCE="+Amount+" WHERE ID="+AccountNumber;
                if(statement.executeUpdate(query)==1)
                {
                    ResultSet rs1 = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+AccountNumber);
                    rs1.next();
                    dwBalance = rs1.getInt("Balance");
                    
                    string="<br><br>Balance :Rs."+dwBalance+"<br>Amount Debited";
                    rs1.close();
                }
                else
                {
                    string="<br><br>Balance :Rs."+dwBalance+"<br>Error in Debit";
                }
                
            }
            PrintWriter out = response.getWriter();
            out.print(string);
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminWithdraw.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}