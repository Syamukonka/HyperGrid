<%@ page import="java.util.ArrayList" %>
<%@ page import="com.major.hypergrid.entity.Customer" %><%--
  Created by IntelliJ IDEA.
  User: SyamukonkaMoonga
  Date: 17/04/2023
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<html>
<%@ include file="header.jsp" %>
<body>
<%@ include file="banner.jsp"%>

<% ArrayList<Customer> customers = (ArrayList<Customer>) request.getAttribute("customers"); %>

<div class="bg_light1">

    <div class="container-lg pd_h_md pd_v_lg mg_t_lg">
        <div class="row_between w100">
            <%--<form action="new">
                <button class="btn btn-success bg_cool_green mg_r_sm ">
                    New customer
                </button>
            </form>--%>
                <form action="search" method="get" class=" row_center fillup w100">
                    <input type="search" name="term" class="form-control fillup w_100 max_500" id="search" placeholder="Search customer, by name or id" aria-describedby="search">
                    <button type="submit" class="btn mg_l_sm bg_cool_green btn-success">Search</button>
                </form>
        </div>

    </div>

    <div class="container-lg pd_h_md mg_v_lg">
        <table class="table  ">
            <thead>
            <tr>
                <th scope="col" >#</th>
                <th scope="col">Customer</th>
                <th scope="col">ID</th>
                <th scope="col">Units</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <% for(int i = 0; i < customers.size(); i++) {
                Customer customer = customers.get(i);

                String typeIcon;
                if(customer.getType().equals("Domestic"))
                    typeIcon = "fa-home";
                else if(customer.getType().equals("Commercial"))
                    typeIcon = "fa-store";
                else
                    typeIcon = "fa-gavel";
            %>
            <tr class="shaker_parent shower_parent" >
                <th scope="row"><%= i+1 %></th><td>
                <div>
                    <p><%= customer.getName() %></p>
                    <p class="mg_t_xs txt_mn fw700 text-secondary"><i class="fa-solid <%= typeIcon %> txt_mn mg_r_xs"></i><%= customer.getType() %></p>
                </div>
            </td>
                <td class="" ><p> <%= customer.getId() %> </p></td>
                <td class="<%= customer.getUnits() > 100 ? "text-success ": (customer.getUnits() > 0 ? " text_amber " : " text-secondary ") %>" >
                    <p class="fw700"><%= String.format("%.2f",customer.getUnits()) %> <span class="mg_l_xs  fw700 txt_mn mg_b_xs">KWH</span></p>
                </td>
                <td class="" >
                    <div class="col_center h100">
                        <div class="row_right no_wrap shower_child items_center">

                            <form action="view" method="get">
                                <input type="hidden" value="<%= customer.getId() %>" name="id" >
                                <button class="btn" > <i class="fa-solid fa-ellipsis-vertical"></i></button>
                            </form>

                            <form action="delete" method="post">
                                <input type="hidden" value="<%= customer.getId() %>" name="id" >
                                <button class="btn shake_once_child" > <i class="fa-solid fa-trash text-danger"></i></button>
                            </form>
                        </div>
                    </div>

                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

    </div>


</div>



</body>
</html>
