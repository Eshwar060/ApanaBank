package MakeClasses;

import java.io.*;
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

public class Balance extends HttpServlet{
	static HttpSession session;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
			System.out.println("Login REQ ::");
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            int accontNo=Integer.parseInt(request.getParameter("accontNo"));
			String filename = "UserLog";
			File file = new File("E:\\Tomcat Base\\webapps\\make6\\Logs\\ " + filename + ".txt");
			FileWriter FW = new FileWriter(file,true);
			java.util.Date now = new java.util.Date();
			String Dis_Date = now.toString();
			System.out.println("Name : "+ name);
			System.out.println("Password : "+ password);
			System.out.println("Account No : "+ accontNo);
			System.out.println();
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
			
            this.session = request.getSession();
            
            System.out.println("Tomcat Session ID : "+session.getId());
            //System.out.println("Tomcat installed path : "+request.getRealPath());
            
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
            ResultSet rs = statement.executeQuery("SELECT * FROM uat where name=\""+name+"\" and password=\""+password+"\" and id=\""+accontNo+"\"");
            if(rs.next())
            {
				FW.write("\nLogin @ " + Dis_Date + "  Account :" + accontNo );
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
			FW.flush();
            FW.close();
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Balance.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
    
}