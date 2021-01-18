<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<body>
<h2>All employees</h2>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="val" items="${employees}">
        <tr>
            <td>${val.name}</td>
            <td>${val.surname}</td>
            <td>${val.department}</td>
            <td>${val.salary}</td>
            <td><button onclick="window.location.href = '/edit/employee/' + ${val.id}">UPDATE</button>
                <form:form method="post" action="/delete/employee">
                    <input name="id" type="hidden" value="${val.id}">
                    <input type="submit" value="DELETE">
                </form:form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<input type="button" value="Add" onclick="window.location.href = '/create/employee'">
</body>
</html>
