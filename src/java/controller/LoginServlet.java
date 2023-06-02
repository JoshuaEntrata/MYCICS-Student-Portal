/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import model.Storing;

/**
 *
 * @author Dwight Kenneth
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection conn;
    int tries = 2;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(config.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
            conn
                    = DriverManager.getConnection(url.toString(), username, password);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /*    try (PrintWriter out = response.getWriter()) {
             TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/

        try {
            String uName = request.getParameter("uname");
            String pWord = request.getParameter("pass");    //retrieve entered credentials

            Statement stmt = conn.createStatement();
            String query1 = "SELECT * FROM CREDENTIALS WHERE EMAIL='" + uName + "' and PASSWORD='" + pWord + "'";   //search credentials table for row with credentials as condition
            ResultSet records1 = stmt.executeQuery(query1);

            if (records1.next()) {  //will enter this if clause if there is a match
                tries = 2;
                String userRole = records1.getString("USER_ROLE");  //retrieve user role of the record 

                if (userRole.equals("Student")) {   //enter this if clause if userrole is "Student"
                    String query2 = "SELECT * FROM STUDENTLIST WHERE ID_CODE='" + records1.getString("ID_CODE") + "'";  //search studentlist for row with the idcode as condition
                    ResultSet records2 = stmt.executeQuery(query2);
                    
                    ArrayList<String> results = new ArrayList<String>();
                    while (records2.next())
                    {
                        int ctr = 1;
                        while (ctr <=20)
                        {
                            String str = records2.getString(ctr);
                            results.add(str);
                            ctr++;
                        }
                    }
                    System.out.print(results);
                    
                    HttpSession session = request.getSession();
                    Storing st = new Storing();
                    
                    st.Ssetter(results);
                    List<String> result = st.Sgetter();
                    session.setAttribute("Sresultlist", result);
                    
                    session.setAttribute("pass", pWord);
                    session.setAttribute("username", uName); //set the uname as "username" attribute for session
                    session.setAttribute("role",userRole);  //set the userole as "role" attribute for session not null
                    
                    response.sendRedirect("student-profile.jsp");
                    
                    
                } else {    ////enter this else clause if userrole is "Admin"
                    String query2 = "SELECT * FROM ADMINLIST WHERE ID_CODE='" + records1.getString("ID_CODE") + "'";    //search adminlist for row with the idcode as condition
                    ResultSet records2 = stmt.executeQuery(query2);
                    request.setAttribute("results", records2);  //set the results as records found from admin list
                    
                    ArrayList<String> results = new ArrayList<String>();
                    while (records2.next())
                    {
                        int ctr = 1;
                        while (ctr <=16)
                        {
                            String str = records2.getString(ctr);
                            results.add(str);
                            ctr++;
                        }
                    }
                    System.out.print(results);

                    HttpSession session = request.getSession();
                    
                    Storing st = new Storing();
                    
                    st.Asetter(results);
                    List<String> result = st.Agetter();
                    session.setAttribute("Aresultlist", result);
                    
                    session.setAttribute("username", uName);    //set the uname as "username" attribute for session
                    session.setAttribute("role",userRole);  //set the userole as "role" attribute for session not null
                    
                    response.sendRedirect("admin-profile.jsp");
                }
            } else if (tries==0)
            {
                tries = 2;
                response.sendRedirect("forgot-pass.jsp");
            }
            else
            {
                tries--;
                response.sendRedirect("login.jsp");
            }

            records1.close();
            stmt.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
