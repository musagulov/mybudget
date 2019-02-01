<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>



    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>


    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/flat-ui.css" rel="stylesheet">





</head>

<body>
<nav class="navbar navbar-inverse navbar-embossed navbar-expand-lg" role="navigation">
    <a class="navbar-brand" href="#" style=" color: #9B59B6; ">${balance} руб.</a>
    <div class="collapse navbar-collapse" id="navbar-collapse-01">
        <ul class="nav navbar-nav mr-auto">
            <li><a href="http://localhost:8081/CurrentResult">Show Transactions</a></li>
            <li><a href="http://localhost:8081/addTransactions">Add Transactions</a></li>
        </ul>

    </div><!-- /.navbar-collapse -->
</nav>

<table id="example" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th>Date</th>
        <th>Type</th>
        <th>Amount</th>
        <th>Comment</th>

    </tr>
    </thead>
    <tbody>


<c:forEach var="savedTransaction" items = "${savedTransactions.transactions}">

<tr>
<td>
                ${savedTransaction.date}
</td>
    <td>
                ${savedTransaction.type}
    </td>
        <td>
                ${savedTransaction.amount}
        </td>
        <td>${savedTransaction.comment}</td>
</tr>


</c:forEach>

    </tbody>

</table>
<script type = "text/javascript">

    $(document).ready(function() {
        $('#example').DataTable( {
            "order": [[ 0, "desc" ]]
        } );
    } );

    $(document).ready(function(){
    $("#example_paginate")[0].className = "pagination";

    $("#example_paginate")[0].style.textAlign="right";
    $("#example_paginate")[0].style.display="block";
    });
</script>
<a href="http://localhost:8080/123"    >poka</a>
</body>
</html>