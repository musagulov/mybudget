package com.springapp.mvc.DAO;

import com.springapp.mvc.model.Transaction;

import java.sql.*;
import java.util.*;

public class TransactionDAO {
    
    private static final String url = "jdbc:sqlite:D:/BD/MyBudget";

    private static Connection con;
    private static Statement stmt;


    public void insertTran(Transaction tran)
    {
        String query = "Insert into [Transaction] (Amount,TranDate,Id,month,comment,TypeId)";
        query = query + " Select ";
        query = query + tran.getAmount();
        query = query + ",'" + tran.getDate() + "'";
        query = query + ",'" + UUID.randomUUID() + "'";
        query = query + ",'" + tran.getDate() + "'";
        query = query + ",'" + tran.getComment() +  "'";
        query = query + ", t.Id from type as t where t.name = '" + tran.getType() + "'";
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

    public List<Transaction> selectTransactions(int count){
        String query = "Select t.name, tr.* from [Transaction] as tr join [Type] as t on t.id= tr.typeId order by tr.TranDate LIMIT " + count;
        System.out.print(query);
        List<Transaction> tranList = new ArrayList<Transaction>();
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
                Transaction transaction = new Transaction();
                transaction.setAmount(rs.getInt("Amount"));
                transaction.setComment(rs.getString("comment"));
                transaction.setDate(rs.getString("TranDate"));
                transaction.setType(rs.getString("Name"));
                tranList.add(transaction);
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
        return tranList;
    }
}
