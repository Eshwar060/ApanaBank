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

public class Delete extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
		
            int dwAccontNo=Integer.parseInt(request.getParameter("accontNo"));
            String strName=request.getParameter("name").toString();
            String strPassword=request.getParameter("password");
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
            String strQueryS="Select NAME,PASSWORD,BALANCE from uat where ID="+dwAccontNo+" and NAME=\""+strName+"\" and PASSWORD=\""+strPassword+"\"";
            ResultSet rs = statement.executeQuery(strQueryS);
            if(rs.next()){
            int balanceCheck=rs.getInt("BALANCE");
            if(balanceCheck>0)
            {
                System.out.println("YOU STILL HAVE BALANCE IN YOUR ACCOUNT");
                response.setContentType("text/html");
                request.setAttribute("PrintMePlz","YOU STILL HAVE BALANCE IN YOUR ACCOUNT");
                RequestDispatcher view = request.getRequestDispatcher("MessageToPrintindex.jsp");
                view.forward(request, response);
            }
            else
            {
            String strQuery="delete from uat where ID="+dwAccontNo+" and NAME=\""+strName+"\" and PASSWORD=\""+strPassword+"\"";
            System.out.println(strQuery);
            statement.execute(strQuery);
            response.sendRedirect("LogoutforDeletion.jsp");
            }
            }
            else
            {
                request.setAttribute("PrintMePlz","WE HAVE NO ACCOUNT WITH THESE DETAILS");
                RequestDispatcher view = request.getRequestDispatcher("MessageToPrintindex.jsp");
                view.forward(request, response);
            }
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Delete.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}