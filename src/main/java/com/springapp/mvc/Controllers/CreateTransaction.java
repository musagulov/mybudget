package com.springapp.mvc.Controllers;

import com.springapp.mvc.DAO.BalanceDAO;
import com.springapp.mvc.DAO.TransactionDAO;
import com.springapp.mvc.model.CurrentBalance;
import com.springapp.mvc.model.Transaction;
import com.springapp.mvc.model.TransactionRich;
import com.springapp.mvc.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;


@Controller
public class CreateTransaction {

    @RequestMapping(value = "/check-user",produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
    public ModelAndView saveTransaction(@ModelAttribute("trich") TransactionRich tran) throws Exception {
        ModelAndView modelAndView = new ModelAndView();



        System.out.print(tran.transactions.get(0).getType() + "Это то что получили");



        //имя представления, куда нужно будет перейти
        modelAndView.setViewName("result");

        BalanceDAO balanceDAO = new BalanceDAO();
        CurrentBalance currentBalance = balanceDAO.getCurrentBalance();

        TransactionDAO tranDAO = new TransactionDAO();


        for ( Transaction tr : tran.transactions)
        {
            tranDAO.insertTran(tr);
            currentBalance.setAmount(currentBalance.getAmount() - tr.getAmount());
        }
        balanceDAO.insertNewBalance(currentBalance.getAmount());

        //записываем в атрибут userJSP (используется на странице *.jsp объект user
        modelAndView.addObject("savedTransactions", tran);

        return modelAndView;
    }
}
