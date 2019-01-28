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
public class Transfer extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            HttpSession session = request.getSession();
            int dwAccontNoS=(Integer)session.getAttribute("Id");
            int dwAccontNoR=Integer.parseInt(request.getParameter("accontNo2"));
            int dwAmountS=Integer.parseInt(request.getParameter("amount"));
            String strNameS = (String)session.getAttribute("Name");
            String strPasswordS =(String)session.getAttribute("pass");
            System.out.println("Info sender"+dwAccontNoS+dwAmountS+strPasswordS+strNameS+"Info R"+dwAccontNoR);
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
            ResultSet rs = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+dwAccontNoS+" and name=\""+strNameS+"\" and password=\""+strPasswordS+"\"");
            if(rs.next())
            {
            int dwBalance = rs.getInt("Balance");
                System.out.println(dwBalance);
            if(dwBalance<dwAmountS)
            {
                response.setContentType("text/html");
                request.setAttribute("PrintMePlz","YOU HAVE INSUFFICIENT BALANCE IN YOUR ACCOUNT CURRENT BALANCE IN YOUR ACCOUNT IS : Rs. "+dwBalance);
                RequestDispatcher view = request.getRequestDispatcher("MessageToPrintindex.jsp");
                view.forward(request, response);
            }
            else
            {
            String query;
            
            rs.close();
            
                ResultSet rs2 = statement.executeQuery("SELECT BALANCE FROM uat where id="+dwAccontNoR);
                
                if(rs2.next())
                {
                int dwBalance2 = rs2.getInt("Balance");
                //System.out.println(dwBalance2);
                dwBalance2=dwBalance2+dwAmountS;
                //System.out.println(dwAccontNoR+"||\\"+dwBalance2);
                query="UPDATE UAT SET BALANCE="+dwBalance2+" WHERE ID="+dwAccontNoR;
                statement.executeUpdate(query);
                
                ResultSet rs1 = statement.executeQuery("SELECT BALANCE,NAME FROM uat where id="+dwAccontNoS);
                rs1.next();
                dwBalance = rs1.getInt("Balance");
                
                dwBalance=dwBalance-dwAmountS;
                strNameS= rs1.getString("NAME");
                response.setContentType("text/html");
                request.setAttribute("Name",strNameS);
                request.setAttribute("currBal",dwBalance);
                RequestDispatcher view = request.getRequestDispatcher("ResultOfDeposit.jsp");
                view.forward(request, response);
                rs1.close();
                query="UPDATE UAT SET BALANCE="+dwBalance+" WHERE ID="+dwAccontNoS+" and name=\""+strNameS+"\" and password=\""+strPasswordS+"\"";
                statement.executeUpdate(query);
                session.setAttribute("Balance", dwBalance);
                }
                else
                {
                    response.setContentType("text/html");
                    request.setAttribute("PrintMePlz","WE HAVE NO ACCOUNT WITH THESE DETAILS");
                    RequestDispatcher view = request.getRequestDispatcher("MessageToPrintindex.jsp");
                    view.forward(request, response);
                }
            
            }
            }
            
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Transfer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}