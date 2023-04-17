package com.major.hypergrid.controllers;

import com.major.hypergrid.entity.Customer;
import com.major.hypergrid.services.CustomerDatabaseManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.stream.Stream;

@Controller
public class CustomerController {

    CustomerDatabaseManager databaseManager = new CustomerDatabaseManager();
    @RequestMapping("/new")
    public String newCustomer(Model model){
        return "new";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") int id){
        databaseManager.delete(id);
        return "redirect:/home";
    }

    @PostMapping("/pay")
    public String processPayment(@RequestParam("units") double units, @RequestParam("id") int id, Model model) {
        databaseManager.rechargeUnits(id, units);
        return "redirect:/view?id="+id;
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") int id, Model model){
        Customer customer = databaseManager.findById(id);
        model.addAttribute("customer", customer);
        return "edit";
    }

    @PostMapping("/submitUpdate")
    public String updateCustomer(Customer customer, Model model){

        if(customer == null ){
            model.addAttribute("error_message","Customer values not received");
            return "new";
        }
        if(!customer.isComplete()){
            model.addAttribute("error_message","Enter all fields");
            return "new";
        }

        databaseManager.update(customer);
        model.addAttribute("success_message","Updated "+customer.getName()+" successfully");

        return "redirect:/view?id="+customer.getId();
    }

    @PostMapping("/submitNew")
    public String addCustomer(Customer customer, Model model) {

        CustomerDatabaseManager databaseManager = new CustomerDatabaseManager();
        if(customer == null ){
            model.addAttribute("error_message","Customer values not received");
            return "new";
        }
        if(!customer.isComplete()){
            model.addAttribute("error_message","Enter all fields");
            return "new";
        }

        customer.setUnits(0.0);
        databaseManager.save(customer);
        model.addAttribute("success_message","Added "+customer.getName()+" successfully");
        return "new";
    }

    @GetMapping("/view")
    public String view(@RequestParam("id") int id , Model model){
        Customer customer = databaseManager.findById(id);
        model.addAttribute("customer", customer);
        return "view";
    }

    @GetMapping("/search")
    public String search(@RequestParam("term") String term,Model model){
        model.addAttribute("term",term);
        ArrayList<Customer> customers =  databaseManager.listAll();
        ArrayList<Customer> result =  new ArrayList<>();
        Stream<Customer> found;
        Stream<Customer> found2 = null;
        int id ;
        try {
            id = Integer.parseInt(term);
            found = customers.stream().filter(c->c.getId()==id);
        }catch (Exception e){
            found = customers.stream().filter(c-> c.getName().toLowerCase().contains(term.toLowerCase()));
            found2 = customers.stream().filter(c-> c.getType().toLowerCase().regionMatches(true,0,term,0,term.length()));

        }
        found.forEach(result::add);
        if(found2!=null)
            found2.forEach(result::add);
        model.addAttribute("customers",result);
        return "searchResults";
    }
}

