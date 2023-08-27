<!DOCTYPE html>
<html>

<head>
    <title> BUY  SELL</title>
<body></body>
<h1> BUYSELL </h1><hr>
<h4> Description</h4>
</head>
<body>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/> <br> <br>
</#list>


<b> Name of the product : </b> ${product.title} <br>
<b> Description : </b> ${product.description} <br>
<b> Price : </b> ${product.price} <br>
<b> City : </b> ${product.city} <br>
<b> Author : </b>  <a href ="/profile/${product.user.username}"> ${product.user.username} </a>  <br>
<b> phone number : </b> ${product.user.phoneNumber}<br>

<hr>

<form action="/" method="get">
    <input type="submit" value="Main menu"/>
</form>



</body>




</html>