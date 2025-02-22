<%-- 
    Document   : dashboardadmin
    Created on : 6 thg 2, 2025, 18:43:20
    Author     : BT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unit Manager</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/admin_style.css">
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="main">
                    <nav class="navbar navbar-expand px-4 py-3">
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end rounded">

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <main class="content px-3 py-4">
                        <div class="container-fluid">
                            <h3 class="fw-bold fs-1 mb-3">Unit Manager</h3>
                            <h5 class="fw-light fs-3 mt-2">Search Condition</h5>
                            <div class="mb-3 d-flex flex-row  justify-content-between">
                                <form method="get" action="units">
                                    <div class="fw-bold fs-3 form-group">
                                        <label>Name</label>
                                        <label>:</label>
                                        <label><input class="ms-3 form-control form-control-lg lg w-100" type="text" name="name" placeholder="Input name of unit" value="${name}"/></label>
                                    <button class="btn btn-success btn-lg ms-4">Search</button>
                                </div>
                                <input type="hidden" name="index" value="${index}"/>
                            </form>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addUnitModal">Add new unit</button>
                        </div>

                        <div class="row card mb-4 mt-2">
                            <div class="card-header ">
                                Unit Manage Table
                            </div>
                            <div class="col-12 card-body scrollable-table table-responsive" style="max-height: 400px; overflow-y: auto;">
                                <table class="table table-striped">
                                    <thead>
                                        <tr class="highlight">
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${units}" var="u" varStatus="loop">
                                            <tr>
                                                <th scope="row">${loop.index}</th>
                                                <td>${u.name}</td>
                                                <td>${u.description}</td>
                                                <td>
                                                    <a href="#">
                                                        <i class="fa fa-pencil-square-o fa-lg m-2" aria-hidden="true" 
                                                           data-bs-toggle="modal" data-bs-target="#updateUnitModal" onclick="openUpdateUnitModal(${u.unitId})"></i>
                                                    </a>
                                                    <a href="#">
                                                        <i class="fa fa-trash fa-lg m-2" aria-hidden="true"
                                                           data-bs-toggle="modal" data-bs-target="#deleteUnitModal" onclick="openDeleteUnitModal(${u.unitId})"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer">

                </footer>
            </div>
        </div>

        <!--Add product modal-->
        <div id="addUnitModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 450px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="addUnit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Unit</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input id="addUnitName" name="name" type="text" class="form-control" required>
                                <p id="errorAddName" style="color: red"></p>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea id="addUnitDescription" name="description" type="text" class="form-control" required></textarea>
                                <p id="errorAddDescription" style="color: red"></p>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Add Unit" onclick="onClickAddUnitModal(event)">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Update unit modal-->
        <div id="updateUnitModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 800px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="updateUnit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title" data-bs-toggle="modal" data-bs-target="#updateUnitModal">Update Unit</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input id="updateUnitName" name="name" type="text" class="form-control">
                                <p id="errorUpdateName" style="color: red"></p>

                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea id="updateUnitDescription" name="description" type="text" class="form-control"></textarea>
                                <p id="errorUpdateDescription" style="color: red"></p>

                            </div>
                            <input id="unitId" type="hidden" name="id"/>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Update Unit" onclick="onClickUpdateUnitModal(event)">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Delete unit modal-->
        <div id="deleteUnitModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 800px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="deleteUnit" method="get">
                        <div class="modal-header">						
                            <h4 class="modal-title" data-bs-toggle="modal" data-bs-target="#deleteUnitModal">Delete Unit</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <p>Do you want to delete this unit ?</p>
                        </div>
                        <input id="deleteUnitId" type="hidden" name="id"/>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-danger" value="Yes" onclick = "handleDeleteItem(event)">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script>
            function openUpdateUnitModal(id) {
                $('#errorUpdateName').text("");
                $('#errorUpdateDescription').text("");
                $("#unitId").val(id);
                // Đường dẫn gọi tới Update Unit lấy dữ liệu Unit cũ show lên trên Dialog, 
                $.get("updateUnit?id=" + id, function (data) {
                    $("#updateUnitName").val(data.name);
                    $("#updateUnitDescription").val(data.description);
                });
            }

            function openDeleteUnitModal(id) {
                $("#deleteUnitId").val(id);
            }
            
            function handleDeleteItem(event) {
                event.preventDefault();
                let id = $("deleteUnitId").val();
                $.get("deleteUnit?id=" + id, function (data, status)) {
                    location.reload();
                }).fail(function (err)) {
                    console.log(err);
                    alert(err.reponseText);
                    $("#deleteUnitModal").modal("hide");
                });
            }

            function onClickAddUnitModal(event) {
                event.preventDefault();
                let name = $("#addUnitName").val();
                let description = $("#addUnitDescription").val();
                let errorAddName = "Please input name of unit is not emty and size is not over 255 characters";
                let errorAddDescription = "Please input name of unit is not emty and size is not over 255 characters";
                let isValid = true;
                if (name.length === 0 || name.length > 255) {
                    $('#errorAddName').text(errorAddName);
                    isValid = false;
                } else {
                    $('#errorAddName').text("");
                }

                if (description.length === 0 || description.length > 255) {
                    $('#errorAddDescription').text(errorAddDescription);
                    isValid = false;
                } else {
                    $('#errorAddDescription').text("");
                }

                if (isValid) {
                    $.post("addUnit", {
                        name: name,
                        description: description
                    }, function (data) {
                        location.reload();
                        }).fail(function (err)) {
                        $('#errorUpdateName').text(err.responeText);
                    });
                }

            }

            function onClickUpdateUnitModal(event) {
                $('#errorUpdateName').text("");
                $('#errorUpdateDescription').text("");
                event.preventDefault();
                let id = $('#unitId').val();
                let name = $('#updateUnitName').val();
                let description = $('#updateUnitDescription').val();
                let errorUpdateName = "Please input name of unit is not empty and size is not over 255 characters";
                let errorUpdateDescription = "Please input description of unit is not empty and size is not over 255 characters";
                let isValid = true;
                name = name.trim();
                description = description.trim();
                if (name.length === 0 || name.length > 255) {
                    $('#errorUpdateName').text(errorUpdateName);
                    isValid = false;
                } else {
                    $('#errorUpdateName').text("");
                }
                if (description.length === 0 || description.length > 255) {
                    $('#errorUpdateDescription').text(errorUpdateDescription);
                    isValid = false;
                } else {
                    $('#errorUpdateDescription').text("");
                }
                if (isValid) {
                    $.post("updateUnit", {
                        id: id,
                        name: name,
                        description: description
                    }, function (data) {
                        location.reload();
                    }).fail(function (err)) {
                        $('#errorUpdateName').text(err.responeText);
                    });
                }
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script type="text/javascript" src="../js/hamburger.js"></script>
        <script type="text/javascript" src="../js/admin/modal.js"></script>
    </body>

</html>
