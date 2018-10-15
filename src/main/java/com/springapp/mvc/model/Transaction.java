package com.springapp.mvc.model;

import org.springframework.stereotype.Component;

/**
 * Created by Администратор on 07.06.2016.
 */
@Component
public class Transaction {
    private String date;
    private Integer amount;
    private String comment;
    private String type;

    public void setDate(String date) {
        this.date = date;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {

        return date;
    }

    public Integer getAmount() {
        return amount;
    }

    public String getComment() {
        return comment;
    }

    public String getType() {
        return type;
    }
}
