<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">

<head>
    <title> BUY  SELL</title>
    <body></body>
<h1> BUYSELL </h1><hr>
<#if user.email??>
    <h3> Username : <i> <a href="/profile/${user.username}">  ${user.username}</a></i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="logout"/>
    </form>

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