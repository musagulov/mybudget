package com.springapp.mvc.Controllers;

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

public class AddTransactions {

    @RequestMapping(value="/addTransactions",produces = "text/html; charset=UTF-8", method = RequestMethod.GET)

    public ModelAndView start() {
        ModelAndView modelAndView = new ModelAndView();

        Transaction tran = new Transaction();
        tran.setAmount(0);
        tran.setComment("");
        List <Transaction> trans = new ArrayList<Transaction>();
        trans.add(tran);

        TransactionRich trich = new TransactionRich();
        trich.setTransactions(trans);
        modelAndView.addObject("trich", trich);

        List<String> types= new TransactionTypeDAO().getAllTypes();

        modelAndView.addObject("types",types );
        modelAndView.setViewName("form");
        return modelAndView;
    }
}
