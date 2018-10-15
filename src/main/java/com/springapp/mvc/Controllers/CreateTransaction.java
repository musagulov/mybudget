package com.springapp.mvc.Controllers;

import com.springapp.mvc.DAO.TransactionDAO;
import com.springapp.mvc.model.Transaction;
import com.springapp.mvc.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CreateTransaction {

    @RequestMapping(value = "/check-user",produces = "text/html; charset=UTF-8")
    public ModelAndView saveTransaction(@ModelAttribute("userJSP") Transaction tran) throws Exception {
        ModelAndView modelAndView = new ModelAndView();



        System.out.print(tran.getType() + "Это то что получили");



        //имя представления, куда нужно будет перейти
        modelAndView.setViewName("result");

        TransactionDAO tranDAO = new TransactionDAO();
        tranDAO.insertTran(tran);
        //записываем в атрибут userJSP (используется на странице *.jsp объект user
        modelAndView.addObject("userJSP", tran);

        return modelAndView;
    }
}
