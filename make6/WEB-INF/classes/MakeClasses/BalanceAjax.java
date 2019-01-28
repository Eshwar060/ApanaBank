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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BalanceAjax extends HttpServlet{
	static HttpSession session;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
			System.out.println("Balance REQ ::");
            PrintWriter pw ;
            pw = response.getWriter();
            this.session = request.getSession();
            int dwAccontNo=(Integer)session.getAttribute("Id");
            String strName =(String)session.getAttribute("Name");
            String strPassword = (String)session.getAttribute("pass");
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
			
            
			
            
            Connection conn=null;
            Statement statement=null;
            try {
                Class.forName(JDBC_DRIVER);
            }//STEP 2: Register JDBC driver 
            catch (ClassNotFoundException e) {
                System.out.println(e);
            }
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM uat where name=\""+strName+"\" and password=\""+strPassword+"\" and id=\""+dwAccontNo+"\"");
            String tString  = "";
            if(rs.next())
            {
                tString=rs.getString("Balance") ;
            }
            else
            {
                tString="Error in Valuation" ;
            }
            rs.close();
            statement.close();
            pw.print(tString);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BalanceAjax.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
    
}