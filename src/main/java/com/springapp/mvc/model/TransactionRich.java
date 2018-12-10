package com.springapp.mvc.model;

import java.util.List;

public class TransactionRich {
    public List<Transaction> transactions;

    public List<Transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions (List t){
        this.transactions = t;
    }
}
