<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: artelio
  Date: 18.01.2021
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form:form modelAttribute="employee" method="post">
    <label>
        Имя <form:input path="name"/>
    </label>
    <br>
    <label>
        Фамилия <form:input path="surname"/>
    </label>
    <br>
    <label>
        Департамент <form:input path="department"/>
    </label>
    <br>
    <label>
        Зарплата <form:input path="salary"/>
    </label>
    <br><br>
    <input type="submit">
</form:form>

</body>
</html>
