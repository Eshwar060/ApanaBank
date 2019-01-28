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

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet{
	static HttpSession session;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
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
            if(rs.next())
            {
                session.setAttribute("pass",rs.getString("password"));
                session.setAttribute("Id", rs.getInt("id"));
                session.setAttribute("Balance",rs.getString("Balance"));
                session.setAttribute("Name",rs.getString("name"));
                session.setAttribute("Phone",rs.getString("phone"));
                session.setAttribute("Address", rs.getString("Address"));
                //response.sendRedirect("index.jsp");
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
    
}