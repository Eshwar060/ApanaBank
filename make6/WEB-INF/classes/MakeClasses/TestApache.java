/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package testapache;
package MakeClasses;

import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.sling.commons.json.JSONArray;

/**
 *
 * @author Eshwar
 */
public class TestApache  extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        try
        {
            String strName=request.getParameter("Name");
            String strNumber=request.getParameter("Number");
            String strSection=request.getParameter("Section");
            String strAddress=request.getParameter("Address");
            int dwMarks=Integer.parseInt(request.getParameter("Marks"));
            int dwClass=Integer.parseInt(request.getParameter("Class"));        
            System.out.println("\n"+dwClass+"\n"+strName+"\n"+dwMarks+"\n"+strSection+"\n");
            String Id="1";
            PrintWriter pw = response.getWriter();
            
            final String USER = "root";
            final String PASS = "Wdykypcw$060";
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/testdb_eshwar";
            Connection con=null;
            Statement state=null;	
            Class.forName(JDBC_DRIVER);
            con=DriverManager.getConnection(DB_URL, USER, PASS);
            state=con.createStatement();

            String query="INSERT INTO student(NAME,CLASS,SECTION,ADDRESS,MARKS_PER) VALUES (\""+strName+"\","+dwClass+",\""+strSection+"\",\""+strAddress+"\","+dwMarks+")";
            state.executeUpdate(query);
            ResultSet rs1= state.executeQuery("Select * from student");
            JSONArray JSONArr = new JSONArray();
            JSONObject JSONObj = new JSONObject();
            HashMap hp =new  HashMap();
            while(rs1.next())
            {
                System.out.println(rs1.getInt("ID")+"\n");
                System.out.println(rs1.getString("NAME")+"\n");
                System.out.println(rs1.getInt("CLASS")+"\n");
                System.out.println(rs1.getString("SECTION")+"\n");
                System.out.println(rs1.getString("ADDRESS")+"\n");
                System.out.println(rs1.getString("MARKS_PER")+"\n");
                

                hp.put("ID",rs1.getInt("ID"));
                hp.put("NAME",rs1.getString("NAME"));
                hp.put("CLASS",rs1.getInt("CLASS"));
                hp.put("ADDRESS",rs1.getString("ADDRESS"));
                hp.put("MARKS_PER",rs1.getString("MARKS_PER"));
                hp.put("SECTION",rs1.getString("SECTION"));
                System.out.println(hp);
                JSONArr.put(hp);
                System.out.println(JSONArr);
            }
            JSONObj.accumulate("Send",JSONArr);

                System.out.println(JSONObj);

        /*
        JSONObj.put("Name",strName);
        JSONObj.put("Number1",strNumber);
        JSONObj.put("Id",Id);
        */
        //JSONObj.put("Hii","Hello");
        //System.out.println(JSONObj);
        pw.print(JSONObj.toString());
        pw.flush();

        state.close();
        con.close();

        } catch (JSONException ex) {
            Logger.getLogger(TestApache.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TestApache.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        catch(SQLException ex)
        {
            Logger.getLogger(TestApache.class.getName()).log(Level.SEVERE, null,ex);
        }
    }
}