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
public class Withdrawal extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            HttpSession session = request.getSession();
            int dwAccontNo=(Integer)session.getAttribute("Id");
            int dwAmount=Integer.parseInt(request.getParameter("amount"));
            String strName =(String)session.getAttribute("Name");
            String strPassword = (String)session.getAttribute("pass");
            System.out.println("withdraw test : values"+dwAccontNo+dwAmount+strName+strPassword);
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
            ResultSet rs = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+dwAccontNo+" and name=\""+strName+"\" and password=\""+strPassword+"\"");
            rs.next();
            int dwBalance = rs.getInt("Balance");
            if(dwBalance<dwAmount)
            {
                response.setContentType("text/html");
                request.setAttribute("PrintMePlz","YOU HAVE INSUFFICIENT BALANCE IN YOUR ACCOUNT <br> CURRENT BALANCE IN YOUR ACCOUNT IS : Rs."+dwBalance);
                RequestDispatcher view = request.getRequestDispatcher("MessageToPrint.jsp");
                view.forward(request, response);
            }
            else
            {
                dwAmount=dwBalance-dwAmount;
                String query;
                query="UPDATE UAT SET BALANCE="+dwAmount+" WHERE ID="+dwAccontNo+" and name=\""+strName+"\" and password=\""+strPassword+"\"";
                System.out.println(query);
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
                else
                {
                    response.setContentType("text/html");
                    request.setAttribute("PrintMePlz","THERE IS PROBLEM WITH THE TRANSACTION");
                    RequestDispatcher view = request.getRequestDispatcher("MessageToPrint.jsp");
                    view.forward(request, response);
                }
            }
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Withdrawal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}