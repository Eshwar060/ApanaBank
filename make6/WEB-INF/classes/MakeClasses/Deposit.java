package MakeClasses;

import java.io.IOException;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Eshwar
 */
public class Deposit extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            int dwAmount=Integer.parseInt(request.getParameter("amount"));
            System.out.println("Deposit REQ ::");
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            HttpSession session = request.getSession();
            int dwAccontNo=(Integer)session.getAttribute("Id");
            Connection conn=null;
            Statement statement=null;
            response.setContentType("text/html");
            try {
                Class.forName(JDBC_DRIVER);
            }//STEP 2: Register JDBC driver 
            catch (ClassNotFoundException e) {
                System.out.println(e);
            }
            conn=DriverManager.getConnection(DB_URL, USER, PASS);
            statement =conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+dwAccontNo);
            if(rs.next())
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
                dwBalance = rs1.getInt("Balance");
                session.setAttribute("Balance", dwBalance);
                strName= rs1.getString("NAME");
                response.setContentType("text/html");
                request.setAttribute("Name",strName);
                request.setAttribute("currBal",dwBalance);
                RequestDispatcher view = request.getRequestDispatcher("ResultOfDeposit.jsp");
                view.forward(request, response);
                rs1.close();
            }
            else{
                request.setAttribute("PrintMePlz","Encountered An Error in Deposition");
                RequestDispatcher view = request.getRequestDispatcher("MessageToPrint.jsp");
                view.forward(request, response);
            }
            }
            else{
                request.setAttribute("PrintMePlz","WE HAVE NO ACCOUNT WITH THESE DETAILS");
                RequestDispatcher view = request.getRequestDispatcher("MessageToPrint.jsp");
                view.forward(request, response);
            }
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Deposit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

