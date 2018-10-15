package com.springapp.mvc.Controllers;

import com.springapp.mvc.DAO.TransactionTypeDAO;
import com.springapp.mvc.model.Transaction;
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

public class CheckUser {

    @RequestMapping(value="/checkuser",produces = "text/html; charset=UTF-8", method = RequestMethod.GET)

    public ModelAndView start() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userJSP", new Transaction());

        List<String> types= new TransactionTypeDAO().getAllTypes();

        modelAndView.addObject("types",types );
        modelAndView.setViewName("form");
        return modelAndView;
    }

   /* @RequestMapping(value = "/check-user",produces = "text/html; charset=UTF-8")
    public ModelAndView check(@ModelAttribute("userJSP") User user) throws Exception {
        ModelAndView modelAndView = new ModelAndView();



            System.out.print(user.getName() + "Это то что получили");



        //имя представления, куда нужно будет перейти
        modelAndView.setViewName("result");

        FieldsToData insert = new FieldsToData(user.getName(),user.getPassword());
        insert.insertdata();
        //записываем в атрибут userJSP (используется на странице *.jsp объект user
        modelAndView.addObject("userJSP", user);

        return modelAndView;
    }*/
}
