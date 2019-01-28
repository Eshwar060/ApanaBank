package MakeClasses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminTransfer extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
            String string;
        try {
            int AccountNumberS = Integer.parseInt(request.getParameter("AccountNumberS"));
            int AccountNumberR = Integer.parseInt(request.getParameter("AccountNumberR"));
            int Amount=Integer.parseInt(request.getParameter("Amount"));
            
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            Connection conn=null;
            Statement statement=null;
            string="";
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+AccountNumberS);

            if(rs.next())
            {
            int dwBalance = rs.getInt("Balance");
            if(dwBalance<Amount)
            {
                string="<br><br>Balance :Rs."+dwBalance+"<br><img src=\"ebWarning.jpg\"> !Insufficient Balance";
            }
            else
            {
                dwBalance=dwBalance-Amount;
                
                String query="";
                query="UPDATE UAT SET BALANCE="+dwBalance+" WHERE ID="+AccountNumberS;
                ResultSet rs2 = statement.executeQuery("SELECT BALANCE FROM uat where id="+AccountNumberR);
                if(rs2.next())
                {
                    String query1="";
                    int dwBalance2 = rs2.getInt("Balance");
                    dwBalance2=dwBalance2+Amount;
                    query1="UPDATE UAT SET BALANCE="+dwBalance2+" WHERE ID="+AccountNumberR;
                    statement.executeUpdate(query1);
                    statement.executeUpdate(query);
                    string="<br><br>Balance :"+dwBalance+"<br>Amount Transfered";
                }
                else
                {
                    string="<br><br>Balance :Rs."+dwBalance+"<br><img src=\"ebWarning.jpg\"> !Account User Does'nt Exist";
                }
             }
            
            }
            PrintWriter out = response.getWriter();
            out.print(string);
        }catch (SQLException ex) {
            Logger.getLogger(AdminTransfer.class.getName()).log(Level.SEVERE, null, ex);

    }
}
}