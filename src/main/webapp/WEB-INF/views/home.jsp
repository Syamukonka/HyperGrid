<html>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.major.hypergrid.entity.Customer" %>
<%@ include file="header.jsp" %>
<body>

    <div class="container-lg pd_v_sm border-bottom-white">
        <% ArrayList<Customer> customers = (ArrayList<Customer>) request.getAttribute("customers"); %>
        <div class="row_between">
            <div class="">
                <h1 class="genos"> Hyper Grid Co.</h1>
                <p class="">Lighting Up the Future of Smart Energy <i class="fa-solid fa-bolt text_amber mg_sm"></i></p>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/" class="btn fw500">Logout <i class="mg_l_sm fa-solid fa-arrow-right-from-bracket "></i></a>
            </div>
        </div>
        <hr>
    </div>

<div class="container-lg pd_t_md pd_b_lg">
    <p class="">welcome,</p>
    <h3 class="">${name}</h3>
</div>



<div class="container-lg pd_h_md mg_t_sm ">
    <div class="row mg_t_md ">
        <div class="col-6 col-sm-3">
            <div class=" col_top items_start pd_md bg_light1 h100 rounded-1">

            </div>
        </div>
        <div class="col-6 col-sm-3 ">
            <div class="shadow h100 col_top items_start pd_md border border-secondary-subtle rounded-1">
                <h1> <%= customers.size() %> </h1>
                <p class="text-secondary mg_t_sm">CUSTOMERS</p>
                <p class="txt_xs text-success"><i class="fa-solid fa-people-group"></i> Overall registered</p>
            </div>
        </div>
        <div class="col-6 col-sm-3 ">
            <div class="shadow h100 col_top items_start pd_md border border-secondary-subtle rounded-1">
                <h1> <%= customers.size()*230 %><i class="fa-solid mg_l_sm txt_sm">KWH</i> </h1>
                <p class="text-secondary mg_t_sm">SUPPLIED POWER</p>
                <p class="txt_xs text-success"><i class="fa-solid fa-clock"></i> Last 30 days</p>
            </div>
        </div>
        <div class="col-6 col-sm-3">
            <div class="shadow h100 col_top items_start pd_md border border-secondary-subtle rounded-1">
                <h1> <i class="txt_sm fa">Rs.</i> <%= customers.size()*340 %> </h1>
                <p class="text-secondary mg_t_sm">GENERATED REVENUE</p>
                <p class="txt_xs text-success"><i class="fa-solid fa-clock"></i> Last 30 days</p>
            </div>
        </div>
    </div>
</div>

<div class="bg_light1">

    <div class="container-lg pd_h_md pd_v_lg mg_t_lg">
        <div class="row_between w100">
            <form action="new">
                <button class="btn btn-success bg_cool_green mg_r_sm ">
                    New customer
                </button>
            </form>
            <form action="search" method="get" class="col_top fillup">
                <div class=" row_right w100">
                    <input type="search" name="term" class="form-control fillup w_100 max_500" id="search" placeholder="Search customer, by name or id" aria-describedby="search">
                    <button type="submit" class="btn mg_l_sm bg_cool_green btn-success">Search</button>
                </div>
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


<%@ include file="scripts.jsp" %>

</body>