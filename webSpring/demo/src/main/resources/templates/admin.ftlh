<!DOCTYPE html>


<html>

<head> BUYSELL </head>
<h4> Admin pannel </h4>

<a href="/" > main menu </a>
<table border="1">
    <tr>
        <th> Email: </th>
        <th> Username: </th>
        <th> Phone number: </th>
        <th> Roles </th>
        <th> Ban user </th>
        <th> More info... </th>
        <th> Edit user </th>
    </tr>
    <#list users as user >

        <tr>
        <th> ${user.email} </th>
        <th> ${user.username} </th>
        <th> ${user.phoneNumber} </th>
            <th> <#if user.isActive()> true
                    <#else> false
                </#if></th>
        <th>  <#list user.roles as role>
                ${role} <#sep>,
            </#list>
        </th>
        <th> <form action="/admin/user/ban/${user.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Ban">
            </form> </th>
        <th>
            <a href="/profile/${user.email}"> More info...</a>
        </th>
            <th>
                <a href="/admin/user/edit/${user.id}"> edit user ...</a>
            </th>
        </tr>

        <#else >
        No users
    </#list>


</table>



</html>