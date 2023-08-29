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
        form {
            margin: 20px;
            text-align: center;
        }

        input[type="text"], input[type="file"], input[type="submit"] {
            padding: 5px;
            margin: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
        }

    </style>


<h1> BUYSELL </h1><hr>
<#if user.email??>
    <h3> Username : <i> <a href="/profile/${user.username}">  ${user.username}</a> </i>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="logout"/>
        </form>
    </h3>

    <#if user.isAdmin() >
        <a href="/admin"> Admin pannel </a>
    </#if>

<#else>
    <a href="/login"> Enter </a><hr>
</#if>




<h4> Products from Kaz</h4>
</head>

<body>

<form action="/" method="get">
    Search by title : <input type="text" name="title"> <br>
    <input type="submit" value="Search"/>
</form>

<#list products as product>
    <div>
        <p> <b> ${product.title}</b>  ${product.price}  | <a href = "/product/${product.id}" > more... </a></p>
    </div>
    <#else>
    <h3> No products </h3>
</#list>

<#if user.email??>

<hr>
<h3> create new Product </h3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    Name : <input type="text" name="title"/><br><br>
    Description : <input type="text" name="description"/><br><br>
    Price : <input type="text" name="price"/><br><br>
    City : <input type="text" name="city"/><br><br>
    File1 : <input type="file" name="file1"/><br><br>
    File2 : <input type="file" name="file2"/><br><br>
    File3 : <input type="file" name="file3"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Add"/>
</form>

</#if>


</body>




</html>