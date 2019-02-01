<!-- обратите внимание на spring тэги -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>


<head>

    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/scripts/flat-ui.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>

    <script src="https://unpkg.com/popper.js@1.14.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>


    <script type="text/javascript" src="resources/js/application.js"></script>


    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/flat-ui.css" rel="stylesheet">


    <script src="https://cdn.jsdelivr.net/npm/zebra_pin@2.0.0/dist/zebra_pin.min.js"></script>
    <script src="resources/Zebra_Datepicker-master/dist/zebra_datepicker.min.js"></script>
    <script src="resources/Zebra_Datepicker-master/examples/examples.js"></script>


    <link rel="stylesheet" href="resources/Zebra_Datepicker-master/dist/css/default/zebra_datepicker.min.css" type="text/css">
    <link rel="stylesheet" href="resources/Zebra_Datepicker-master/examples/examples.css" type="text/css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/scripts/shCore.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/scripts/shBrushJScript.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/scripts/shBrushXml.min.js"></script>

    <script type="text/javascript">
        SyntaxHighlighter.defaults['toolbar'] = false;
        SyntaxHighlighter.all();
    </script>

    <script type="text/javascript">

        function add() {

            var $well = $('#wellTemplate').clone(true);
            $well[0].removeAttribute('style');
            var newId = 'well' + Date.now();
            $well[0].id=newId;

            var inputDateName = $well[0].children[0].children[0].children[0].name;
            inputDateName = 'transactions['+inputDateName + '].date';
            $well[0].children[0].children[0].children[0].name = inputDateName;
            $('#wellTemplate > div > div:nth-child(1) > input[type="text"]')[0].name = 1 + Number($('#wellTemplate > div > div:nth-child(1) > input[type="text"]')[0].name);

            var inputTypeName =  $well[0].children[0].children[1].name;
            inputTypeName = 'transactions['+ inputTypeName + '].type';
            $well[0].children[0].children[1].name = inputTypeName;
            $('#wellTemplate > div > select')[0].name = 1+ Number($('#wellTemplate > div > select')[0].name);

            var inputAmountName = $well[0].children[0].children[2].children[0].children[0].name;
            inputAmountName = 'transactions['+ inputAmountName + '].amount';
            $well[0].children[0].children[2].children[0].children[0].name = inputAmountName;
            $('#wellTemplate > div > div:nth-child(3) > div > input')[0].name = 1+ Number($('#wellTemplate > div > div:nth-child(3) > div > input')[0].name);

            var inputCommentName = $well[0].children[0].children[3].children[0].name;
            inputCommentName = 'transactions['+ inputCommentName + '].comment';
            $well[0].children[0].children[3].children[0].name = inputCommentName;
            $('#wellTemplate > div > div.col-sm-4 > input')[0].name = 1+ Number($('#wellTemplate > div > div.col-sm-4 > input')[0].name);

            $well.appendTo("#formAddTran");
            $('#'+newId+' > div > select')[0].setAttribute('data-toggle','select');
            $('#'+newId+' > div > div > input')[0].setAttribute('class','form-control date-picker');
            $('.form-control.date-picker').Zebra_DatePicker();
            $('.form-control.date-picker').last().data('Zebra_DatePicker').set_date(new Date());
            $('[data-toggle="select"]').select2();
        }

    </script>


</head>

<nav class="navbar navbar-inverse navbar-embossed navbar-expand-lg" role="navigation">
    <div class="collapse navbar-collapse" id="navbar-collapse-01">
        <ul class="nav navbar-nav mr-auto">
            <li><a href="http://localhost:8081/CurrentResult">Show Transactions</a></li>
            <li><a href="http://localhost:8081/addTransactions">Add Transactions</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>

<form:form method="post" enctype="application/x-www-form-urlencoded" acceptCharset="UTF-8" modelAttribute="trich" action="check-user" id ="formAddTran" >

    <button type = "Submit" class="btn btn-info">Submit</button>
    <c:forEach items="${trich.transactions}" var="tran" varStatus="status">

    <div class="well" style = "display: none " id = "wellTemplate">

    <div class="row">
        <div class="col-sm-2">
            <input name="${status.index}" type="text" data-zdp_readonly_element="false"/>
        </div>

        <select class="form-control select select-primary mbl" name="${status.index}">
            <c:forEach var="type" items = "${types}">
                <option value="${type}">${type}</option>
            </c:forEach>

        </select>

        <div class="col-sm-2">
            <div class="input-group">

                <input name="${status.index}" type="text" placeholder="..." class="form-control"/>
                <span class="input-group-text">руб</span>
            </div>

        </div>
        <div class="col-sm-4">
            <input type="text" class="form-control" placeholder="Comment please" name="${status.index}"/>
        </div>
        <div class="col-sm-1">
            <button type="button" class="btn btn-info" onclick = "add()" >Add</button>

        </div>
    </div>

</div>
    </c:forEach>

</form:form>

<script type = "text/javascript">
    add();

</script>





</body>

</html>
