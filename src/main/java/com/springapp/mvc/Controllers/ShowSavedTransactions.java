package com.springapp.mvc.Controllers;

import com.springapp.mvc.DAO.TransactionDAO;
import com.springapp.mvc.DAO.TransactionTypeDAO;
import com.springapp.mvc.model.Transaction;
import com.springapp.mvc.model.TransactionRich;
import com.springapp.mvc.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Администратор on 07.06.2016.
 */
@Controller
public class ShowSavedTransactions {
    @RequestMapping(value = "/CurrentResult", produces = "text/html; charset=UTF-8", method = RequestMethod.GET)

    public ModelAndView showSaved(){

        TransactionRich savedTransactions = new TransactionRich();
        TransactionDAO tranDao = new TransactionDAO();
        savedTransactions.setTransactions(tranDao.selectTransactions(20));

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("result");
        modelAndView.addObject("savedTransactions", savedTransactions);
        return modelAndView;
    }
}
