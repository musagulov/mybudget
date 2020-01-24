package com.springapp.mvc.Controllers;


import com.fasterxml.jackson.annotation.JsonProperty;
import com.springapp.mvc.DAO.TransactionDAO;
import com.springapp.mvc.model.Transaction;
import com.springapp.mvc.model.TransactionRich;

import org.springframework.http.MediaType;

import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Администратор on 07.06.2016.
 */
@RestController
public class ShowSavedTransactionsRest {

    public static class ReponceTest{
        private String param1;
        private String param2;

        public ReponceTest(String p1, String p2){
            this.param1 = p1;
            this.param2 = p2;
        }
        @JsonProperty("p1")
        public String getParam1() {
            return param1;
        }
        @JsonProperty("p1")
        public void setParam1(String param1) {
            this.param1 = param1;
        }
        @JsonProperty("p2")
        public String getParam2() {
            return param2;
        }
        @JsonProperty("p2")
        public void setParam2(String param2) {
            this.param2 = param2;
        }
    }
    @RequestMapping(value = "/CurrentResultRest", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    public @ResponseBody ReponceTest showSaved(){

        TransactionRich savedTransactions = new TransactionRich();
        TransactionDAO tranDao = new TransactionDAO();
        savedTransactions.setTransactions(tranDao.selectTransactions(50));
        ReponceTest res = new ReponceTest("12", "qweqwe");
        return res;
    }
}
