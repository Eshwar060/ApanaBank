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


public class AdminLogin extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
    {
        try {
            String name = request.getParameter("Aname");
            String password=request.getParameter("Apassword");
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            HttpSession session= request.getSession();
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
                ResultSet rs = statement.executeQuery("SELECT * FROM admin where name=\""+name+"\" and password=\""+password+"\"");
                if(rs.next())
                {
                    response.setContentType("text/html");
                  //  session.setAttribute("Apass",rs.getString("password"));
                  //  session.setAttribute("AName",rs.getString("name"));
                    request.setAttribute("rApass",rs.getString("password"));
                    request.setAttribute("rAName",rs.getString("name").toUpperCase());
                    //response.sendRedirect("index.jsp");
                    RequestDispatcher view = request.getRequestDispatcher("AdminMain.jsp");
                    view.forward(request, response);
                }
                else
                {
                    request.setAttribute("PrintMePlz","NO RECORDS FOUND!");
                    RequestDispatcher view = request.getRequestDispatcher("MessageToPrint.jsp");
                    view.forward(request, response);
                }
                rs.close();
                statement.close();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}