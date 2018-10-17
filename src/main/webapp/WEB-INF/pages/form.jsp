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

            var element = document.createElement('div');
            element.class = 'well';
            element.innerHTML = '<div class="row">\n' +
                '        <div class="col-sm-2">\n' +
                '            <input  id="datepicker" type="text" class="form-control date-picker" data-zdp_readonly_element="false"/>\n' +
                '        </div>\n'+
				' <select class="form-control select select-primary mbl" id="type" data-toggle="select" path="type">\n' +
            '                <option value="1">1<option> \n' +
                '<option value="2">2<option> \n' +
            '        </select>\n'+            '        <div class="col-sm-2">\n' +
                '            <div class="input-group">\n' +
                '                <input type="text" placeholder="..." class="form-control"/>\n' +
                '                <span class="input-group-text">руб</span>\n' +
                '            </div>\n' +
                '        </div>\n' +
                '        <div class="col-sm-4">\n' +
                '            <input type="text" class="form-control" placeholder="Comment please" />\n' +
                '        </div>\n' +
                '        <div class="col-sm-1">\n' +
                '            <button type="button" class="btn btn-info" onclick = "add()" >Add</button>\n' +
                '        </div>\n' +
                '    </div>'


            document.getElementById("userJSP").appendChild(element);
            $('.form-control.date-picker').Zebra_DatePicker();
            $('[data-toggle="select"]').select2();
        }

    </script>


</head>



<nav class="navbar navbar-default navbar-expand-lg" role="navigation">
    <div class="collapse navbar-collapse" id="navbar-collapse-01">
    </div><!-- /.navbar-collapse -->
</nav><!-- /navbar -->

<spring:form method="post" enctype="application/x-www-form-urlencoded" acceptCharset="UTF-8" modelAttribute="userJSP" action="check-user">

    <button type = "Submit" class="btn btn-info">Submit</button>
<div class="well">

    <div class="row">
        <div class="col-sm-2">
            <spring:input path="date" type="text" class="form-control date-picker" data-zdp_readonly_element="false"/>
        </div>

        <spring:select class="form-control select select-primary mbl" id="type" data-toggle="select" path="type">
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


<script  type="text/javascript">
    $('.form-control.date-picker').Zebra_DatePicker();
</script>




</body>

</html>
