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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseClass extends HttpServlet {
                final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
    {
        try {
            String strName=request.getParameter("name");
            String strPassword=request.getParameter("password");
            String strAmount=request.getParameter("amount");
            String strAddress=request.getParameter("address");
            String strPhone=request.getParameter("phone");
            strName=strName.toUpperCase();

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
            String query;
            query="INSERT INTO UAT(NAME,PASSWORD,BALANCE,Address,PHONE) VALUES (\""+strName+"\",\""+strPassword+"\",\""+strAmount+"\",\""+strAddress+"\",\""+strPhone+"\")";
            
            if(statement.executeUpdate(query)==1)
            {
                System.out.println("Executed Success!..");
                PrintWriter out = response.getWriter();
                out.println("Entry taken..");
                ResultSet rs = statement.executeQuery("Select * from uat where name=\""+strName+"\" and password=\""+strPassword+"\"");
                while (rs.next()) {
                    int dwId = rs.getInt("id");
                    strPhone = rs.getString("Phone");
                    System.out.println(strPhone);
                    String dwBalance = rs.getString("Balance");
                   // int dwPerc = rs.getInt("percentage");
                    String strNamet = rs.getString("name");//"name";
                  //  System.out.println("Percentage:"+dwPerc);
                    response.setContentType("text/html");
                    request.setAttribute("Name", strNamet);
                    request.setAttribute("Id", dwId);
                    request.setAttribute("Phone", strPhone);
                    request.setAttribute("Balance", dwBalance);
                    RequestDispatcher view = request.getRequestDispatcher("resultforc.jsp");
                try{
                    view.forward(request, response);
                }catch(Exception e){
                    System.out.println(e);
                }
            }
            }
            System.out.println("-------------------------------");
           /* while (rs.next()) {
                int dwId = rs.getInt("id");
                int dwSalary = rs.getInt("salary");
                int dwPerc = rs.getInt("percentage");
                String strNamet = rs.getString("name");//"name";
                System.out.println("ID: " + dwId);
                System.out.println("Age: " + dwSalary);
                System.out.println("Name: " + strNamet);
                System.out.println("Percentage:"+dwPerc);
                System.out.println("-------------------------------");
            }*/
           // rs.close(); 
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}