/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tripadvisor.dbconnection;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Alert;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Salehin
 */
public class Index extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                String jdbcURL = "jdbc:mysql://localhost:3306/userdb";
//                String user = "root";
//                String password = "";
//                Connection con = null;
//                con = DriverManager.getConnection(
//                        jdbcURL, user, password);
                DatabaseConnection databaseConnection = new DatabaseConnection();
                Connection con =databaseConnection.getConncetion();
                Statement stmt = con.createStatement();
                String userQuery = "select email,password from emailinfo";
                ResultSet emailResultSet = stmt.executeQuery(userQuery);
                String email = request.getParameter("userEmail");
                String pass = request.getParameter("userPassword");
                HttpSession session = request.getSession();
                Integer accessCount;
                synchronized (session) {
                    accessCount = (Integer) session.getAttribute("accessCount");
                    if (accessCount == null) {
                        accessCount = 0; // autobox int to Integer
                    } else {
                        accessCount = new Integer(accessCount + 1);
                    }
                    session.setAttribute("accessCount", accessCount);
                    session.setAttribute("userEmail",email);
                }
                System.out.println(accessCount);
                System.out.println(session.getAttribute("userEmail"));
                while (emailResultSet.next()) {

                    if (email.equals(emailResultSet.getString(1)) && pass.equals(emailResultSet.getString(2))) {
                        RequestDispatcher rqDispatcher = request.getRequestDispatcher("/home.jsp");
                        rqDispatcher.include(request, response);
                    } else {
                        RequestDispatcher rqDispatcher = request.getRequestDispatcher("/index.jsp");
                        rqDispatcher.include(request, response);
                        out.println("<p style='color:white;text-align:center;'>User name or password is wrong</p>");
                    }

                }

            } catch (ClassNotFoundException e) {
                out.println("Class not found");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Can not conncet with database", e);
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
