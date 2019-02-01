package com.springapp.mvc.model;

import org.springframework.stereotype.Component;

@Component
public class CurrentBalance {
    private static Integer amount;

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }
}
