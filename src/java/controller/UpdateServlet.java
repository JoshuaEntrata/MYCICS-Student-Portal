/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.*;
import java.io.PrintWriter;
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
import model.Storing;

/**
 *
 * @author Dwight Kenneth
 */
public class UpdateServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        ArrayList results = (ArrayList) session.getAttribute("Sresultlist");
        
        
        String code = results.get(1).toString();
        
        String SNum = results.get(1).toString();
//        String EAdd = request.getParameter("EAdd");
//            if (EAdd.equals(""))
        String EAdd = results.get(2).toString();
        String LNam = request.getParameter("LNam");
            if (LNam.equals(""))
                LNam = results.get(3).toString();
        String FNam = request.getParameter("FNam");
            if (FNam.equals(""))
                FNam = results.get(4).toString();
        String MNam = request.getParameter("MNam");
            if (MNam.equals(""))
                MNam = results.get(5).toString();
        String DOB = request.getParameter("DOB");
            if (DOB.equals(""))
                DOB = results.get(6).toString();
        String Gen = request.getParameter("Gen");
            if (Gen.equals(""))
                Gen = results.get(7).toString();
        String Add = request.getParameter("Add");
            if (Add.equals(""))
                Add = results.get(8).toString();
        String Deg = request.getParameter("Deg");
            if (Deg.equals(""))
                Deg = results.get(9).toString();
        String STra = request.getParameter("STra");
            if (STra.equals(""))
                STra = results.get(10).toString();
        String Sta = request.getParameter("Sta");
            if (Sta.equals(""))
                Sta = results.get(11).toString();
        String Fat = request.getParameter("Fat");
            if (Fat.equals(""))
                Fat = results.get(12).toString();
        String Mot = request.getParameter("Mot");
            if (Mot.equals(""))
                Mot = results.get(13).toString();
        String APar = request.getParameter("APar");
            if (APar.equals(""))
                APar = results.get(14).toString();
        String CPar = request.getParameter("CPar");
            if (CPar.equals(""))
                CPar = results.get(15).toString();
        String Gua = request.getParameter("Gua");
            if (Gua.equals(""))
                Gua = results.get(16).toString();
        String AGua = request.getParameter("AGua");
            if (AGua.equals(""))
                AGua = results.get(17).toString();
        String CGua = request.getParameter("CGua");
            if (CGua.equals(""))
                CGua = results.get(18).toString();
        
        try {
            Statement stmt = conn.createStatement();
            String query1 = "UPDATE STUDENTLIST SET ID_CODE = '"+SNum+"', EMAIL = '"+EAdd+"' , L_NAME = '"+LNam+"' , F_NAME = '"+FNam+"' , M_NAME = '"+MNam+"' , DOB = '"+DOB+"' ,"
                    + "GENDER = '"+Gen+"' , ADDRESS = '"+Add+"' , DEGREE = '"+Deg+"' , S_TRACK = '"+STra+"' , STATUS = '"+Sta+"' , FATHER = '"+Fat+"' , "
                    + "MOTHER = '"+Mot+"' , P_ADDRESS = '"+APar+"' , P_CONTACT = '"+CPar+"' , GUARDIAN = '"+Gua+"' , G_ADDRESS = '"+AGua+"' , G_CONTACT = '"+CGua+"'"
                    + "where ID_CODE='"+code+"'";
            int rowsAffected = stmt.executeUpdate(query1);
            conn.commit();
            
            String query = "UPDATE CREDENTIALS SET ID_CODE = '"+SNum+"', EMAIL = '"+EAdd+"' where ID_CODE='"+code+"'" ;
            stmt.executeUpdate(query);
            conn.commit();
        String query2 = "SELECT * FROM STUDENTLIST WHERE ID_CODE='" + SNum + "'";    
        ResultSet records2 = stmt.executeQuery(query2);    
        
        ArrayList<String> Uresults = new ArrayList<String>();
                    while (records2.next())
                    {
                        int ctr = 1;
                        while (ctr <=20)
                        {
                            String str = records2.getString(ctr);
                            Uresults.add(str);
                            ctr++;
                        }
                    }
          
        Storing st = new Storing();
        st.Ssetter(Uresults);
        List<String> result = st.Sgetter();
        session.setAttribute("Sresultlist", result);
        
        Object uRole = session.getAttribute("role");
        String role = uRole.toString();
                if(role.equals("Student"))
                    {
                        response.sendRedirect("student-profile.jsp");
                    }
                else
                    {
                        response.sendRedirect("DisplayServlet");
                    }
            
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
            
        System.out.println(SNum+EAdd+LNam+FNam+MNam+DOB+Gen+Add+Deg+STra+Sta+Fat+Mot+APar+CPar+Gua+AGua+CGua);
        
        
        
        
        
        
        
        
        
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
