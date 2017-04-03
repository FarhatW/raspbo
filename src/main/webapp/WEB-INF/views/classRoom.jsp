<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<c:url value="../resources/CSS/main.css" />" />
    <link rel="stylesheet" href="<c:url value="../resources/CSS/bootstrap.min.css" />"/>
    <link rel="stylesheet" href="<c:url value="../resources/CSS/simple-sidebar.css" />"/>
    <title>Salle</title>
</head>
<body>
<div id="wrapper">
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a href="#">
                    Menu
                </a>
            </li>
            <li>
                <a href="/welcome">Utilisateurs</a>
            </li>
            <li>
                <a href="/classRoom">Gestion des classes</a>
            </li>
            <li>
                <a href="/presence">Presence du jour</a>
            </li>
        </ul>
    </div>
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-xs-12 menu">
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">=</a>
                    </div>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <h2>
                            user : ${pageContext.request.userPrincipal.name} | <a
                                href="javascript:formSubmit()"> Logout</a>
                        </h2>
                    </c:if>
                    <div class="col-xs-12 firstblock">
                        <h3>Ajouter une nouvelle salle :</h3>
                        <form:form method="post" modelAttribute="clasRoom" action="${pageContext.request.contextPath}/addClass">
                            <div class="col-xs-4 col-xs-offset-1 indentblock">
                                <div class="form-group">
                                    <form:hidden path="id" />
                                    <form:label path="name">nom de la classe:</form:label>
                                    <form:input path="name" size="30" maxlength="30" class="form-control"></form:input>
                                </div>
                                <div class="form-group">
                                    <form:label path="addMac">Adresse Mac:</form:label>
                                    <form:input path="addMac" size="30" maxlength="30" class="form-control"></form:input>
                                </div>
                                <div class="form-group">

                                    <form:label path="site_id">Site</form:label>
                                    <select name="site_id" class="form-control">
                                        <c:if test="${!empty listOfSites}">
                                            <c:forEach items="${listOfSites}" var="site">
                                                <option value="${site.id}" selected="${clasRoom!= null && site.id == clasRoom.site_id}">${site.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-default pull-right btnstyle">Valider</button>
                            </div>
                        </form:form>
                    </div>
                    <div class="col-xs-12 secondblock">
                        <h3>Afficher les salles :</h3>
                        <c:if test="${!empty listOfClassRoom}">
                            <div class="col-xs-10 col-xs-offset-1">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th width="80">Id</th>
                                        <th width="120">Nom</th>
                                        <th width="60">Site</th>
                                        <th width="60">Edit</th>
                                        <th width="60">Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listOfClassRoom}" var="classR">
                                        <tr>
                                            <td>${classR.id}</td>
                                            <td>${classR.name}</td>
                                            <td>${classR.site_id}</td>
                                            <td><a href="<c:url value='/updateClass/${classR.id}' />" ><img src="../resources/images/edit.png"></a></td>
                                            <td><a href="<c:url value='/deleteClass/${classR.id}' />" ><img src="../resources/images/delete.png"></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>
</html>

