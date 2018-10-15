package com.springapp.mvc.model;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Администратор on 07.06.2016.
 */
@Component
public class TransactionType {
    private List<String> allTypes;
    private String name;

    public List<String> getAllTypes() {
        return allTypes;
    }

    public void setAllTypes(List<String> allTypes) {
        this.allTypes = allTypes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
