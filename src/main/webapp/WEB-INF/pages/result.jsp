<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>



    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>


    <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css" rel="stylesheet">


</head>

<body>
<nav class="navbar navbar-default navbar-expand-lg" role="navigation">
    <div class="collapse navbar-collapse" id="navbar-collapse-01">
    </div><!-- /.navbar-collapse -->
</nav><!-- /navbar -->

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

</script>
<a href="http://localhost:8080/123"    >poka</a>
</body>
</html>