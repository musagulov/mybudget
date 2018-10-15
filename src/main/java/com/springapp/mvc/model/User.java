package com.springapp.mvc.model;

import org.springframework.stereotype.Component;

/**
 * Created by Администратор on 07.06.2016.
 */
@Component
public class User {

    private String name;
    private String password;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
