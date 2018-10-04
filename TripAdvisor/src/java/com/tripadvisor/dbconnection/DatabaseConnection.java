/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tripadvisor.dbconnection;

/**
 *
 * @author Salehin
 */
import java.sql.*;
public class DatabaseConnection {
    
    public Connection getConncetion() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
                String jdbcURL = "jdbc:mysql://localhost:3306/userdb";
                String user = "root";
                String password = "";
                Connection con = null;
                con = DriverManager.getConnection(
                        jdbcURL, user, password);
        
        return con;
    }
    
}
