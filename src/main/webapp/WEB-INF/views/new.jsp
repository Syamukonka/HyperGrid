<%--
  Created by IntelliJ IDEA.
  User: SyamukonkaMoonga
  Date: 15/04/2023
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<html>
<%@ include file="header.jsp" %>
<body>
    <div class="container">
        <%@ include file="banner.jsp"%>
        <div class=" pd_sm col_center w100 mg_v_lg">
            <div class="w_100 max_500 rounded-1 items_center shadow">
                <h3 class="text_center mg_t_md mg_h_md">Add a new Customer</h3>
                <hr>
                <% String emsg = (String)request.getAttribute("error_message");
                    if(emsg!=null) { %>
                    <div class="pd_md">
                        <p class="text_amber"><i class="fa-solid fa-warning mg_r_sm"> </i> <%= emsg %> </p>
                    </div>
                <% } %>
                <% String smsg = (String)request.getAttribute("success_message");
                    if(smsg!=null) { %>
                <div class="pd_md">
                    <p class="text-success"><i class="fa-solid fa-check-circle mg_r_sm ">  </i><%= smsg %></p>
                </div>
                <% } %>

                <form action="submitNew" method="post" class="w100 pd_md">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input name="name" class="form-control" id="name" type="text" placeholder="Customer's full name">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" id="address" placeholder="Home address of the customer">
                    </div>
                    <label class="form-label">Customer category</label>
                    <div class="mb-3 form-floating">
                        <select class="form-select" id="floatingSelect" name="type" aria-label="Floating label select example">
                            <option selected value="Domestic">Domestic</option>
                            <option value="Commercial">Commercial</option>
                            <option value="Government">Government</option>
                        </select>
                        <label for="floatingSelect">This customer is </label>
                    </div>
                    <div class="row_right">
                        <button type="submit" class="btn btn-success bg_cool_green" >Add <%= smsg!=null && !smsg.isEmpty() ? "another" : "new " %> customer</button>
                    </div>
                </form>
            </div>
        </div>


    </div>



</body>
</html>
