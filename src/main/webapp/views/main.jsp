<%@ page import="java.util.Date" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Objects" %>
<%--
  Created by IntelliJ IDEA.
  User: jl
  Date: 7/12/2022
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <style>
        .main-content {
            padding: 50px;
        }
    </style>
</head>
<body>

<%--<%!--%>
<%--    String localname = "John";--%>
<%--%>--%>

<%--<%--%>
<%--    Date date = new Date();--%>
<%--    PrintWriter writer = response.getWriter();--%>
<%--    writer.println(date);--%>
<%--%>--%>

<%--<%=12 * 324%>--%>

<%--<h1>Hello--%>
<%--    <%--%>

<%--        String name = request.getParameter("name");--%>
<%--        if (Objects.isNull(name))--%>
<%--            writer.print(localname);--%>
<%--        else--%>
<%--            writer.print(name);--%>
<%--    %>--%>
<%--</h1>--%>

<%--<a href="/logout" class="btn btn-success">--%>
<%--    Logout--%>
<%--</a>--%>
<%--${username}--%>

<%--<table class="table">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Id</th>--%>
<%--        <th>Name</th>--%>
<%--        <th>Author</th>--%>
<%--    </tr>--%>

<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${books}" var="book">--%>
<%--        <tr>--%>
<%--            <td>${book.id}</td>--%>
<%--            <td>${book.name}</td>--%>
<%--            <td>${book.author}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

<%--    </tbody>--%>
<%--</table>--%>

<%--add button--%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="main-content">


    <button type="button" class="btn btn-success mb-4 text-white" data-toggle="modal" data-target="#exampleModal">
        ➕ Add
    </button>

    <%--modal--%>
    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Save book</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/add">
                        <div class="row">
                            <div class="col-md-6">

                                <div class="form-group mb-3">
                                    <label>Name</label>
                                    <input type="text" name="name" class="form-control" placeholder="Book name"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Author</label>
                                    <input type="text" name="author" class="form-control" placeholder="Book author"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Description</label>
                                    <input type="text" name="description" class="form-control"
                                           placeholder="Book description"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Genre</label>
                                    <select class="form-control" name="genre" id="genre">
                                        <c:forEach items="${genres}" var="genre">
                                            <option c:out value="${genre.name()}">${genre.getKey()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Language</label>
                                    <select class="form-control" name="language" id="language">
                                        <c:forEach items="${languages}" var="language">
                                            <option c:out value="${language.name()}">${language.getValue()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>


                            <div class="col-md-6">

                                <div class="form-group mb-3">
                                    <label>Page Count</label>
                                    <input type="number" name="pageCount" class="form-control"
                                           placeholder="Book pageCount"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Cover</label>
                                    <input type="file" name="cover" class="form-control" placeholder="Book Cover"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Book</label>
                                    <input type="file" name="file" class="form-control" placeholder="Book"/>
                                </div>

                                <button type="submit" class="btn btn-primary">save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--card--%>
    <div class="row ml-4">
        <c:forEach items="${books}" var="book">
            <div class="col-2">
                <div class="card p-2">
                    <img style="background-color: #e5e3e3" class="card-img-top" src="" width="140" height="350"
                         alt="${book.name}">
                    <div class="card-body">
                        <h5 class="card-title" c:value="${book.name}"></h5>
                        <i style="display:block;">author : <i>${book.author}</i></i>
                        <i style="display:block;">description : <i>${book.description}</i></i>
                        <i style="display:block;">genre : <i>${book.genre}</i></i>
                        <i style="display:block;">language : <i>${book.language}</i></i>
                        <i style="display:block;">pageCount : <i>${book.pageCount}</i></i>
                        <i style="display:block;">downloadCount : <i>${book.downloadCount}</i></i>
                        <a href="#">Download Cover</a>
                        <br/>
                        <a href="#">Download Book</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>
