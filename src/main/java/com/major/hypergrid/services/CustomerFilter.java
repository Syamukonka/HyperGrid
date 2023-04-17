package com.major.hypergrid.services;

import com.major.hypergrid.entity.Customer;

public class CustomerFilter {

    public static void getBalance(Customer customer){
        double rate;
        switch (customer.getType()){
            case Customer.COM: rate = 3.1; break;
            case Customer.GOV: rate = 2.0; break;
            default: rate = 2.3;
        }


    }
}
