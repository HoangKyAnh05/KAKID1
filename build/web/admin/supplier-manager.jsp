<%-- 
    Document   : dashboardadmin
    Created on : 6 thg 2, 2025, 18:43:20
    Author     : BT
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Supplier Manager</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/admin_style.css">
        <link rel="stylesheet" href="../css/manager.css">
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
                            <h3 class="fw-bold fs-1 mb-3">Supplier Manager</h3>
                            <h5 class="fw-light fs-3 mt-2">Search Condition</h5>
                            <div class="search-add-container d-flex align-items-center justify-content-between">
                                <form method="get" action="suppliers" class = "d-flex d-flex align-items-center">
                                    <div class="search-field d-flex align-items-center me-3">
                                        <label class="fw-bold">Name</label>
                                        <label class="fw-bold ms-2">:</label>
                                        <input class="form-control form-control-lg ms-2" type="text" name="name" placeholder="Input name of supplier" value="${name}"/>
                                </div>
                                <div class="search-field d-flex flex-row align-items-center me-3">
                                    <label class="fw-bold text-nowrap">Phone</label>
                                    <label class="fw-bold ms-2">:</label>
                                    <input class="form-control form-control-lg ms-2" type="text" name="phone" placeholder="Input phones of supplier" value="${phone}"/>
                                </div>
                                <div class="search-field d-flex align-items-center me-3">
                                    <label class="fw-bold">Address</label>
                                    <label class="fw-bold ms-2">:</label>
                                    <input class="form-control form-control-lg ms-2 w-auto" type="text" name="address" placeholder="Input address of supplier" value="${address}" style="width: 300px !important"/>
                                </div>
                                <button class="btn btn-success btn-lg">Search</button>
                            </form>
                            <button type="button" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#addSupplierModal">Add new supplier</button>
                        </div>



                        <div class="row card mb-4 mt-2">
                            <div class="card-header ">
                                Supplier Manage Table
                            </div>
                            <div class="row">
                                <div class="col-12 card-body scrollable-table table-responsive" style="max-height: 400px; overflow-y: auto;" >
                                    <table class="table table-striped">
                                        <thead>
                                            <tr class="highlight">
                                                <th scope="col">#</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Supply Manager</th>
                                                <th scope="col">Address</th>
                                                <th scope="col">Add at</th>
                                                <th scope="col">Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${suppliers}" var="s" varStatus="loop">
                                                <tr>
                                                    <th scope="row">${loop.index}</th>
                                                    <td>${s.name}</td>
                                                    <td>${s.email}</td>
                                                    <td>${s.phone}</td>
                                                    <td>${s.supplyManager}</td>
                                                    <td>${s.address}</td>
                                                    <td>
                                                        <fmt:formatDate value="${s.createdAt}" pattern="dd-MM-yyyy" />
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-row">
                                                            <a href="#">
                                                                <i class="fa fa-pencil-square-o fa-lg m-2" aria-hidden="true" 
                                                                   data-bs-toggle="modal" data-bs-target="#updateSupplierModal" onclick="openUpdateSupplierModal(${s.supplierId})" onKeyUp="this.click()" tabindex="0"></i>
                                                            </a>    
                                                            <a href="#">
                                                                <i class="fa fa-trash fa-lg m-2" aria-hidden="true"
                                                                   data-bs-toggle="modal" data-bs-target="#deleteSupplierModal" onclick="openDeleteSupplierModal(${s.supplierId})" onKeyUp="this.click()" tabindex="1"></i>
                                                            </a> 
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer">

                </footer>
            </div>
        </div>

        <!--Add supplier modal-->
        <div id="addSupplierModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 700px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="addSupplier" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title" data-bs-toggle="modal" data-bs-target="#addSuppliertModal">Add Supplier</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input id="addSupplierName" name="name" type="text" class="form-control" >
                                <p id="errorAddName" style="color: red;"></p>
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <textarea id="addSupplierEmail" name="email" type="text" class="form-control" ></textarea>
                                <p id="errorAddEmail" style="color: red;"></p>
                            </div>
                            <div class="form-group">
                                <label>Phone:</label>
                                <textarea id="addSupplierPhone" name="phone" type="text" class="form-control" ></textarea>
                                <p id="errorAddPhone" style="color: red;"></p>
                            </div>
                            <div class="form-group">
                                <label>Supply Manager</label>
                                <textarea id="addSupplierSupplyManager" name="supplyManager" type="text" class="form-control" ></textarea>
                                <p id="errorAddSupplyManager" style="color: red;"></p>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea id="addSupplierAddress" name="address" type="text" class="form-control" ></textarea>
                                <p id="errorAddAddress" style="color: red;"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Add Supplier"  onclick="onClickAddSupplierModal(event)">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Update supplier modal-->
        <div id="updateSupplierModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 700px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="updateSupplier" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title" data-bs-toggle="modal" data-bs-target="#updateSupplierModal">Update Supplier</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input id="updateSupplierName" name="name" type="text" class="form-control" >
                                <p id="errorUpdateName" style="color: red"></p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <textarea id="updateSupplierEmail" name="email" type="text" class="form-control" ></textarea>
                                <p id="errorUpdateEmail" style="color: red"></p>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <textarea id="updateSupplierPhone" name="phone" type="text" class="form-control" ></textarea>
                                <p id="errorUpdatePhone" style="color: red"></p>
                            </div>
                            <div class="form-group">
                                <label>Supply Manager</label>
                                <textarea id="updateSupplierSupplyManager" name="supplyManager" type="text" class="form-control" ></textarea>
                                <p id="errorUpdateSupplyManager" style="color: red"></p>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea id="updateSupplierAddress" name="address" type="text" class="form-control" ></textarea>
                                <p id="errorUpdateAddress" style="color: red"></p>
                            </div>
                            <input id="supplierId" type="hidden" name="id"/>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Update Supplier" onclick="onClickUpdateSupplierModal(event)">
                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Delete supplier modal-->
        <div id="deleteSupplierModal" class="modal fade">
            <div class="modal-dialog" style="margin-left: 700px;">
                <div class="modal-content modal-add" style="width: 150%;">
                    <form action="deleteSupplier" method="get">
                        <div class="modal-header">						
                            <h4 class="modal-title" data-bs-toggle="modal" data-bs-target="#deleteSupplierModal">Delete Unit</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <p id="textDeleteModal">Do you want to delete this supplier ?</p>
                        </div>
                        <input id="deleteSupplierId" type="hidden" name="id"/>
                        <div class="modal-footer">
                            <input id="confirmDelButton" type="submit" class="btn btn-danger" value="Yes"" onclick="handleDeleteItem(event)">
                            <input id="cancelDelButton" type="button" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script>
            function openUpdateSupplierModal(id) {
                $('#errorUpdateName').text("");
                $('#errorUpdateEmail').text("");
                $('#errorUpdatePhone').text("");
                $('#errorUpdateSupplyManager').text("");
                $('#errorUpdateAddress').text("");
                $("#supplierId").val(id);
                $.get("updateSupplier?id=" + id, function (data) {
                    $("#updateSupplierName").val(data.name);
                    $("#updateSupplierEmail").val(data.email);
                    $("#updateSupplierPhone").val(data.phone);
                    $("#updateSupplierSupplyManager").val(data.supplyManager);
                    $("#updateSupplierAddress").val(data.address);
                });
            }

            function openDeleteSupplierModal(id) {
                $("#deleteSupplierId").val(id);
            }

            function handleDeleteItem(event) {
                event.preventDefault();
                let id = $("#deleteSupplierId").val();
                $.get("deleteSupplier?id=" + id, function (data, status) {
                    location.reload();
                }).fail(function (err) {
                    console.log(err);
                    alert(err.responseText);
                   $("#deleteSupplierModal").modal("hide");
                });
            }


            function onClickAddSupplierModal(event) {
                event.preventDefault();

                let name = $("#addSupplierName").val().trim();
                let email = $("#addSupplierEmail").val().trim();
                let phone = $("#addSupplierPhone").val().trim();
                let supplyManager = $("#addSupplierSupplyManager").val().trim();
                let address = $("#addSupplierAddress").val().trim();

                let errorMessage = {
                    name: "Please input a valid name (not empty and up to 255 characters)",
                    email: "Please input valid email (not empty and up to 255 characters)",
                    phone: "Please input valid phone (not empty and contains 10 characters)",
                    supplyManager: "Please input valid supply manager (not empty and up to 255 characters)",
                    address: "Please input a valid address (not empty and up to 255 characters)"
                };

                let isValid = true;

                // Validate Name
                if (name.length === 0 || name.length > 255) {
                    $('#errorAddName').text(errorMessage.name);
                    isValid = false;
                } else {
                    $('#errorAddName').text("");
                }

                // Validate email Info
                if (email.length === 0 || email.length > 255 || !isValidEmail(email)) {
                    $('#errorAddEmail').text(errorMessage.email);
                    isValid = false;
                } else {
                    $('#errorAddEmail').text("");
                }

                // Validate phone Info
                if (phone.length === 0 || phone.length > 255 || !isValidPhone(phone)) {
                    $('#errorAddPhone').text(errorMessage.phone);
                    isValid = false;
                } else {
                    $('#errorAddPhone').text("");
                }

                // Validate supply manager Info
                if (supplyManager.length === 0 || supplyManager.length > 255) {
                    $('#errorAddSupplyManager').text(errorMessage.supplyManager);
                    isValid = false;
                } else {
                    $('#errorAddSupplyManager').text("");
                }

                // Validate Address
                if (address.length === 0 || address.length > 255) {
                    $('#errorAddAddress').text(errorMessage.address);
                    isValid = false;
                } else {
                    $('#errorAddAddress').text("");
                }

                if (isValid) {
                    // Submit the form if all fields are valid
                    $.post("addSupplier", {
                        name: name,
                        email: email,
                        phone: phone,
                        supplyManager: supplyManager,
                        address: address},
                            function (data) {
                                location.reload();
                            }).fail(function (err) {
                        $('#errorAddName').text(err.responseText);
                    });
                }
            }

            // Function to validate email format
            function isValidEmail(email) {
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailRegex.test(email);
            }

            // Function to validate phone number format
            function isValidPhone(phone) {
                const phoneRegex = /^\+?[0-9]{10,15}$/; // Allows optional "+" and 7 to 15 digits
                return phoneRegex.test(phone);
            }


            function onClickUpdateSupplierModal(event) {


                $('#errorUpdateName').text("");
                $('#errorUpdateContactInfo').text("");
                $('#errorUpdateAddress').text("");
                event.preventDefault();
                let id = $('#supplierId').val();
                let name = $('#updateSupplierName').val().trim();
                let email = $('#updateSupplierEmail').val().trim();
                let phone = $('#updateSupplierPhone').val().trim();
                let supplyManager = $('#updateSupplierSupplyManager').val().trim();
                let address = $('#updateSupplierAddress').val().trim();
                let errorMessage = {
                    name: "Please input a valid name (not empty and up to 255 characters)",
                    email: "Please input valid email (not empty and up to 255 characters)",
                    phone: "Please input valid phone (not empty and contains 10 characters)",
                    supplyManager: "Please input valid supply manager (not empty and up to 255 characters)",
                    address: "Please input a valid address (not empty and up to 255 characters)"
                };
                let isValid = true;
                // Validate Name
                if (name.length === 0 || name.length > 255) {
                    $('#errorUpdateName').text(errorMessage.name);
                    isValid = false;
                } else {
                    $('#errorUpdateName').text("");
                }

                // Validate email Info
                if (email.length === 0 || email.length > 255 || !isValidEmail(email)) {
                    $('#errorUpdateEmail').text(errorMessage.email);
                    isValid = false;
                } else {
                    $('#errorUpdateEmail').text("");
                }

                // Validate phone Info
                if (phone.length === 0 || phone.length > 255 || !isValidPhone(phone)) {
                    $('#errorUpdatePhone').text(errorMessage.phone);
                    isValid = false;
                } else {
                    $('#errorUpdatePhone').text("");
                }

                // Validate supply manager Info
                if (supplyManager.length === 0 || supplyManager.length > 255) {
                    $('#errorUpdateSupplyManager').text(errorMessage.supplyManager);
                    isValid = false;
                } else {
                    $('#errorUpdateSupplyManager').text("");
                }

                // Validate Address
                if (address.length === 0 || address.length > 255) {
                    $('#errorUpdateAddress').text(errorMessage.address);
                    isValid = false;
                } else {
                    $('#errorUpdateAddress').text("");
                }

                if (isValid) {
                    $.post("updateSupplier",
                            {id: id,
                                name: name,
                                email: email,
                                phone: phone,
                                supplyManager: supplyManager,
                                address: address
                            }, function (data) {
                        location.reload();
                    }).fail(function (err) {
                        $('#errorUpdateName').text(err.responseText);
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


