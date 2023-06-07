<%@ page import="java.util.List" %>
<%@ page import="ru.javawebinar.topjava.model.MealTo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Meals</title>
    <style>
        .red {
            color: red;
            background-color: coral;
        }

        .green {
            color: green;
            background-color: greenyellow;
            border-bottom: dashed;
        }
    </style>
</head>
<body>

<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>

<table style="border-bottom: dashed;">
    <thead>
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
        <th>isExceeded</th>
    </tr>
    </thead>
    <!-- почему-то контекст переменной теряется-->
    <% List<MealTo> mealToList = (List<MealTo>) request.getAttribute("mealToList"); %>

    <c:forEach items="<%= mealToList %>" var="mealTo">
        <jsp:useBean id="mealTo" type="ru.javawebinar.topjava.model.MealTo"/>
        <tr class="${mealTo.excess ? 'red' : 'green'}">
            <td> ${mealTo.dateTime}</td>
            <td>${mealTo.description}</td>
            <td>${mealTo.calories}</td>
            <td>${mealTo.excess}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
