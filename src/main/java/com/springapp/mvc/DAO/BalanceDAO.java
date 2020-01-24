package com.springapp.mvc.DAO;

import com.springapp.mvc.model.Transaction;

import java.sql.*;
import java.util.*;
import java.util.Date;


import com.springapp.mvc.model.CurrentBalance;

public class BalanceDAO {
    private static final String url = "jdbc:sqlite:D:\\BD\\MyBudget.db";

    private static Connection con;

    private static Statement stmt;

    public CurrentBalance getCurrentBalance(){
        CurrentBalance balance = new CurrentBalance();
        int amount;
        String query = "Select amount from Balance order by datetime desc LIMIT 1";

        try {
            // opening database connection to MySQL server
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url);

            // getting Statement object to execute query
            stmt = con.createStatement();

            // executing SELECT query
            ResultSet rs =  stmt.executeQuery(query);


            while (rs.next()) {
                balance.setAmount((rs.getInt("amount")));
            }


        }
        catch (SQLException sqlEx) {
            System.out.print(query)        ;
            System.out.print("qwd");
            sqlEx.printStackTrace();
        } finally {
            //close connection ,stmt and resultset here
            try { con.close(); } catch(SQLException se) { /*can't do anything */ }
            try { stmt.close(); } catch(SQLException se) { /*can't do anything */ }
        }
               return balance;
    }

    public void insertNewBalance (Integer amount)
    {
        Date currentDatetime = new Date();
        String query = "Insert into [Balance] (amount,datetime) VALUES (" + amount + ", '" + new Timestamp(currentDatetime.getTime()) + "')";

        try {
            // opening database connection to MySQL server
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url);

            // getting Statement object to execute query
            stmt = con.createStatement();

            // executing SELECT query
            stmt.executeUpdate(query);
        }
        catch (SQLException sqlEx) {
            System.out.print(query)        ;
            System.out.print("qwd");
            sqlEx.printStackTrace();
        } finally {
            //close connection ,stmt and resultset here
            try { con.close(); } catch(SQLException se) { /*can't do anything */ }
            try { stmt.close(); } catch(SQLException se) { /*can't do anything */ }
        }


    }

}
