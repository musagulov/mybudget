package com.springapp.mvc.Controllers;

import com.springapp.mvc.model.Transaction;

import java.sql.*;
import java.util.UUID;

/**
 * Created by Администратор on 07.06.2016.
 */
public class FieldsToData {

    private Transaction tran;


    private static final String url = "jdbc:sqlite:D:/BD/MyBudget";

    private static Connection con;
    private static Statement stmt;


    public FieldsToData(Transaction tran) {
        this.tran = tran;

    }

    public void insertdata()
    {
        String query = "Insert into [Transaction] (Amount,TranDate,Id,month,comment,TypeId)";
        query = query + " Select ";
        query = query + this.tran.getAmount();
        query = query + ",'" + this.tran.getDate() + "'";
        query = query + ",'" + UUID.randomUUID() + "'";
        query = query + ",'" + this.tran.getDate() + "'";
        query = query + ",'" + this.tran.getComment() +  "'";
        query = query + ", t.Id from type as t where t.name = '" + this.tran.getType() + "'";
        System.out.print(query);


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
