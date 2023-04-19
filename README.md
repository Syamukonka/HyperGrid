# HyperGrid (Electricity Billing System 2)

_www.syamukonka.com_

### Programming Features 
<ol>
    <li> <b>Database </b> 
    <ul>
        <li> Hibernate </li>
        <li> JPA(Java Persistence API) </li>
        <li> MySql </li>
    </ul>
    <li> <b> Spring MVC </b>
        <ul>
            <li> Dispatcher Servlet </li>
            <li> Controllers </li>
            <li> Models and Views </li>
            <li> Web Configuration </li>
        </ul>
    </li>
    <li>
        <b> Advanced Java</b>
        <ul> 
            <li> Streams </li>
            <li> Collections </li>
        </ul>
    </li>

</ol>


### Definitions
1. <b>JPA (Java Persistence API)</b><br/>
The Java persistence API is a specification for persistence, which loosely means any method through which Java objects overlive their application process.
2. <b> Hibernate </b> </br> Hibernate is a framework which provides some abstraction layer, meaning that the programmer does not have to worry about the implementations, Hibernate does the implementations for you internally like Establishing a connection with the database, writing query to perform CRUD operations etc.It is a java framework which is used to develop persistence logic. Persistence logic means to store and process the data for long use
3. <b> Object-Relational Mapping (ORM)</b> <br/> a programming technique for converting data between relational database structures and the OOPs Objects.


### Application Feature
1. Add customer
2. Edit and update a customer
3. Delete a customer
4. View a customer
5. Search customers _(By name, id, category)_
6. Admin Login 
7. Business Statistics

### Packages and Classes 

#### 1. Entity package
This package Contains ORM classes, all mapping to the respective database tables 
1. <code>Customer</code> <br/> 
Annotated with <code>@Entity</code>. It is the Object mapped to the  <code>customer table</code> of the relational database.
2. <code>Admin</code> <br/>
Another __Entity__,this one is mapped to the <code>admin table</code> in the database.

#### 2. Controllers package
This package includes the <code>@Controller</code> annotated classes used to serve the client requests.
1. <code>CustomerController</code> <br/>
Handles all requests related customer operations and logic such as <code>search</code>,<code>add</code>, <code>delete</code>, <code>view</code>, <code>edit/update</code>.
2. <code>LoginController</code> <br/>
Handles the login request, performs authentication and verification, and then redirects the successfully logged-in user to the home page.

#### 3. Services packer
This package contains the classes for Database management, using the <code>javax.persistence</code> API, backed with __Hibernate__ framework.
1. <code>CustomerDatabaseManager</code> <br/>
Defines database logic to perform safe CRUD operations.
2. <code>AdminDatabaseManager</code> <br/>
Defines operations for fetching admin users. This is mainly used to perform authentication.

#### 4. Config package

This package, containers Web and Server Configuration files.
1. <code>WebAppInitializer</code><br/>
It specifies some server properties, for the application. In this class, we initialize a dynamic <code>DispatcherServlet</code> and give is a given a context. Then a mapping of "/" is added to it. This dispatcher, is a front controller, responsible for receiving client requests and sending them to the corresponding controller.
2. <code>WebMvcConfig</code> <br/>
In this class, we use a <code>InternalResourceViewResolver</code> to easily, identify view files, by providing a prefix(Corresponding to their path/location) and a suffix(corresponding to their extension). The is path provided, must match the Tomcat deployment directory. 
