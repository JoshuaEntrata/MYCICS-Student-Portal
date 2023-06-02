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
import javax.swing.*;

/**
 *
 * @author Dwight Kenneth
 */
public class SignupServlet extends HttpServlet {

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
       
        try {
            
            Statement stmt = conn.createStatement();
            
            String Lname = request.getParameter("lname");
            String Fname = request.getParameter("fname");
            String Mname = request.getParameter("mname");
                if(Mname.equals("N/A"))
                    Mname = "-";
              
            String Uname = Fname.toLowerCase().charAt(0)+Lname.toLowerCase().replace(" ", "")+".cics@ust.edu.ph";
            
            String Bday = request.getParameter("bday");
            String pass = request.getParameter("pass");
            String Cpass = request.getParameter("cpass");
            String role = request.getParameter("role");
            String latest="";

            if(pass.equals(Cpass)){
                if (role.equals("Student")){
                    String query = "SELECT ID_CODE FROM STUDENTLIST";
                    ResultSet records = stmt.executeQuery(query);

                    while (records.next()){
                        latest = records.getString("ID_CODE");
                    }
                    latest = String.valueOf((Integer.parseInt(latest))+1);

                    String credAdd = "INSERT INTO CREDENTIALS (ID_CODE,EMAIL,PASSWORD,USER_ROLE)VALUES ('"+latest+"','"+Uname+"','"+pass+"','"+role+"')";
                    String stuAdd = "INSERT INTO STUDENTLIST (ACC_TYPE,ID_CODE,EMAIL,L_NAME,F_NAME,M_NAME,DOB,GENDER,ADDRESS,DEGREE,S_TRACK,STATUS,FATHER,MOTHER,P_ADDRESS,P_CONTACT,GUARDIAN,G_ADDRESS,G_CONTACT,PASSWORD)"
                            + "VALUES ('"+role+"','"+latest+"','"+Uname+"','"+Lname+"','"+Fname+"','"+Mname+"','"+Bday+"','-','-','-','-','-','-','-','-',"
                            + "'-','-','-','-','"+pass+"')";
                    stmt.executeUpdate(credAdd);
                    stmt.executeUpdate(stuAdd);

                    response.sendRedirect("login.jsp");
                    }
                    else {
                        String query = "SELECT ID_CODE FROM ADMINLIST";
                        ResultSet records = stmt.executeQuery(query);

                    while (records.next()){
                    latest = records.getString("ID_CODE");
                    }
                    latest = String.valueOf((Integer.parseInt(latest))+1);

                    String credAdd = "INSERT INTO CREDENTIALS (ID_CODE,EMAIL,PASSWORD,USER_ROLE)VALUES ('"+latest+"','"+Uname+"','"+pass+"','"+role+"')";
                    String admAdd = "INSERT INTO ADMINLIST (ACC_TYPE,ID_CODE,L_NAME,F_NAME,M_NAME,DOB,GENDER,M_STATUS,NATIONALITY,ADDRESS,P_EMAIL,COMPANY,DEPARTMENT,C_EMAIL,EMP_TYPE,DES_TITLE)"
                            + "VALUES ('"+role+"','"+latest+"','"+Lname+"','"+Fname+"','"+Mname+"','"+Bday+"','-','-','-','-','-','-',"
                            + "'-','"+Uname+"','-','-')";

                    stmt.executeUpdate(credAdd);
                    stmt.executeUpdate(admAdd);

                    response.sendRedirect("login.jsp");
                }
            }
            else{
                response.sendRedirect("signup.jsp");
            }
            
            
        }catch (SQLException sqle) {
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
