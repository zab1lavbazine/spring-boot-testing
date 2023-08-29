<!DOCTYPE html>



<html>

<head>
    <title>BUYSELL</title>
</head>
<body>
<h1> PROFILE </h1>
<a href="/"> main page </a>

<h2> Username : ${user.username}</h2>
<h2> Email : ${user.email}</h2>
<h2> Phone number : ${user.phoneNumber}</h2>

<#list user.products as product>
    <div>
        <p> <b>  ${product.title}</b> <b> ${product.price}</b>    |   <a href="/product/${product.id}"> more...   </a></p>
    </div>

    <#else>
        <h3> No products </h3>
</#list>




</body>
</html>