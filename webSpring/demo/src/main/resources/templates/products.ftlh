<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">


<head>
    <title> BUY  SELL</title>

    <style>
        /* Reset default margins and padding */
        body, h1, h3, h4, p, form {
            margin: 0;
            padding: 0;
        }

        /* Basic styling for the body */
        body {
            font-family: Arial, sans-serif;
        }

        /* Header styling */
        h1 {
            text-align: center;
            margin-top: 20px;
        }

        hr {
            width: 80%;
            margin: 20px auto;
            border: none;
            border-top: 2px solid #ccc;
        }

        /* Styling for links */
        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        /* User section styling */
        h3 {
            margin-top: 20px;
        }

        /* Product list styling */
        .product {
            padding: 10px;
            border: 1px solid #ccc;
            margin: 10px 0;
            background-color: #f9f9f9;
        }

        .product a {
            color: #333;
        }

        .product a:hover {
            text-decoration: underline;
        }

        /* Form styling */

        form[id="search-input"] {
            margin: 5px;
            position: static;
            text-align: left;
        }



        input[type="text"], input[type="file"], input[type="submit"] {
            padding: 5px;
            margin: 5px;
            appearance: menulist-button;
        }

        input[type="submit"] {
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
        }

        .user-container{
            display: flex;
            text-align: center;
            border: 1px solid #ccc; /* Border */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Shadow */
            padding: 10px; /* Padding to create some space between content and borders */
            background-color: #f9f9f9; /* Background color */
            width: 350px; /* Width of the box */
            margin: 10px; /* Margin for spacing */
            float: right; /* Float the box to the right */
        }

        .create-product {
            border: 1px solid #ccc; /* Border */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Shadow */
            padding: 10px; /* Adjusted padding for spacing between content and borders */
            background-color: #f9f9f9; /* Background color */
            width: 250px; /* Adjusted width of the box */
            margin: 20px 0 20px 50px;
        }

        /* Style for the form inputs */
        .create-product form input[type="text"],
        .create-product form input[type="file"],
        .create-product form input[type="submit"] {
            display: block;
        }

        .create-product form input[type="submit"] {
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
        }

        .images-in-create {
            border: 1px solid #ccc; /* Border */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Shadow */
            padding: 10px; /* Adjusted padding for spacing between content and borders */
            background-color: #f9f9f9; /* Background color */
            width: 250px; /* Adjusted width of the box */
            margin: 20px 0 20px 50px;
        }


    </style>


<h1> BUYSELL </h1><hr>

    <div class="user-container">
        <#if user.email??>
            <h3> Username : <i> <a href="/profile/${user.username}">  ${user.username}</a> </i>
                <form id="logout&admin-panel" action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="logout"/>
                </form>
            <#if user.isAdmin() >
                <form id="logout&admin-panel" action="/admin">
                    <input type="submit" value="admin panel"/>
                </form>
            </#if>
        <#else>
            <a href="/login"> Enter </a><hr>
            </h3>
        </#if>
    </div>




<h4> Products from Kaz</h4>
</head>
<#if user.email??>
<div class="create-product">
    <hr>
    <h3> create new Product </h3>
    <form id="create-product" action="/product/create" method="post" enctype="multipart/form-data">
        Name : <input type="text" name="title"/><br><br>
        Description : <input type="text" name="description"/><br><br>
        Price : <input type="text" name="price"/><br><br>
        City : <input type="text" name="city"/><br><br>
        <div class="images-in-create">
            File1 : <input type="file" name="file1"/><br><br>
            File2 : <input type="file" name="file2"/><br><br>
            File3 : <input type="file" name="file3"/><br><br>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Add"/>
    </form>
</div>
</#if>

<body>

<form id="search-input" action="/" method="get">
    Search by title : <input type="text" name="title"> <br>
    <input type="submit" value="search"/>
</form>

<#list products as product>
    <div>
        <p> <b> ${product.title}</b>  ${product.price}  | <a href = "/product/${product.id}" > more... </a></p>
    </div>
    <#else>
    <h3> No products </h3>
</#list>

<#if user.email??>



</#if>


</body>




</html>