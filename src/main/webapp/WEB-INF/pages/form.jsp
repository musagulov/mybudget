<!-- обратите внимание на spring тэги -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

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
            $well.appendTo("#formUserJSP");
            $('#'+newId+' > div > select')[0].setAttribute('data-toggle','select');
            $('#'+newId+' > div > div > input')[0].setAttribute('class','form-control date-picker');
            $('.form-control.date-picker').Zebra_DatePicker();
            $('[data-toggle="select"]').select2();
        }

    </script>


</head>



<nav class="navbar navbar-default navbar-expand-lg" role="navigation">
    <div class="collapse navbar-collapse" id="navbar-collapse-01">
    </div><!-- /.navbar-collapse -->
</nav><!-- /navbar -->

<spring:form method="post" enctype="application/x-www-form-urlencoded" acceptCharset="UTF-8" modelAttribute="userJSP" action="check-user" id ="formUserJSP" >

    <button type = "Submit" class="btn btn-info">Submit</button>
<div class="well" style = "display: none " id = "wellTemplate">

    <div class="row">
        <div class="col-sm-2">
            <spring:input path="date" type="text" data-zdp_readonly_element="false"/>
        </div>

        <spring:select class="form-control select select-primary mbl" path="type">
            <c:forEach var="type" items = "${types}">
                <spring:option value="${type}">${type}</spring:option>
            </c:forEach>

        </spring:select>

        <div class="col-sm-2">
            <div class="input-group">

                <spring:input path="amount" type="text" placeholder="..." class="form-control"/>
                <span class="input-group-text">руб</span>
            </div>

        </div>
        <div class="col-sm-4">
            <spring:input type="text" class="form-control" placeholder="Comment please" path="comment"/>
        </div>
        <div class="col-sm-1">
            <button type="button" class="btn btn-info" onclick = "add()" >Add</button>

        </div>
    </div>

</div>

</spring:form>

<script type = "text/javascript">
    var $well = $('#wellTemplate').clone(true);
    $well[0].removeAttribute('style');
    $well[0].id='well3';
    $well.appendTo("#formUserJSP");
    $('#well3 > div > select')[0].setAttribute('data-toggle','select');
    $('#well3 > div > div > input')[0].setAttribute('class','form-control date-picker');
    $('.form-control.date-picker').Zebra_DatePicker();
    $('[data-toggle="select"]').select2();

</script>





</body>

</html>
