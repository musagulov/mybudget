package com.springapp.mvc.DAO;

import com.springapp.mvc.model.Transaction;
import com.springapp.mvc.model.TransactionType;

import java.sql.*;
import java.util.*;

public class TransactionTypeDAO {

    private static final String url = "jdbc:sqlite:D:\\BD\\MyBudget.db";

    private static Connection con;
    private static Statement stmt;

    public List<String> getAllTypes()
    {
        String query = "Select name from [type]";
        ArrayList<String> res = new ArrayList<String>();

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
            ResultSet result = stmt.executeQuery(query);
            while (result.next())
            {
                res.add(result.getString(1));
            }
            System.out.print("succes result");
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
        return res;
    }
}
