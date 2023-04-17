package com.major.hypergrid.controllers;

import com.major.hypergrid.entity.Admin;
import com.major.hypergrid.entity.Customer;
import com.major.hypergrid.services.AdminDatabaseManager;
import com.major.hypergrid.services.CustomerDatabaseManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;

@Controller
public class LoginController {
    CustomerDatabaseManager repo = new CustomerDatabaseManager();
    AdminDatabaseManager databaseManager = new AdminDatabaseManager();

    @GetMapping("/home")
    public String getHome (Model model){

        String username = databaseManager.getActive();

        ArrayList<Customer> customers = repo.listAll();
        Collections.reverse(customers);
        model.addAttribute("customers",customers);
        model.addAttribute("name",username);
        model.addAttribute("size",customers.size());

        return "home";
    }


    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model){

        Admin admin = databaseManager.fetchOne(username.toLowerCase().trim());

        if(admin==null){
            model.addAttribute("message","User doesn't exist");
            return "error";
        } else if (!admin.getPassword().equals(password)) {
            model.addAttribute("message","The password you entered was incorrect");
            return "error";
        }
        databaseManager.setActive(admin.getName());

        //System.out.println(repo.listAll());
        return "redirect:/home";
    }

}
