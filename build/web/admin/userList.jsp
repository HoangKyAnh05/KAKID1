<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/admin_style.css">
        <script src="../js/bootstrap.bundle.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../js/hamburger.js"></script>
        <script type="text/javascript" src="../js/admin/modal.js"></script>
        <link rel="stylesheet" href="../css/manager.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            body, html {
                margin: 0;
                padding: 0;
                width: 100vw;
                height: 100vh;
                overflow-x: hidden;
            }

            .wrapper {
                display: flex;
                width: 100%;
                height: 100vh;
            }

            .sidebar {
                width: 250px; /* Điều chỉnh chiều rộng sidebar nếu cần */
                min-width: 250px;
                background-color: #14213d; /* Màu nền sidebar */
                height: 100vh;
            }

            .container {
                flex: 1; /* Phần chính chiếm toàn bộ không gian còn lại */
                padding: 30px;
                overflow-x: auto;
                background-color: #f8f9fa; /* Màu nền nhẹ nhàng */
            }

            .table-container {
                width: 100%;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #FFC1C1; /* Màu giống trong ảnh */
                color: #4B4B4B;
            }

            .action-btn {
                background: none;
                border: none;
                color: #555;
                font-size: 20px;
                cursor: pointer;
            }

            .btn-custom {
                background-color: #D2691E;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
            }

            .btn-custom:hover {
                background-color: #A0522D;
                color: white;
            }

        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure you want to delete user ID = " + id + "?")) {
                    window.location = "delete-account?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="container" style="padding: 30px;">
                    <h2 class="text-center">User Management</h2>
                    <div class="text-right mb-3">
                        <a href="userlist?action=add" class="btn btn-custom">+ Add New User</a>
                    </div>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>UserID</th>
                                <th>Username</th>
                                <th>Fullname</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th>Address</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${listRe == null}">
                            <tr>
                                <td colspan="8" class="text-center"><strong>No sellers found</strong></td>
                            </tr>
                        </c:if>
                        <c:if test="${listRe != null}">
                            <c:forEach items="${listRe}" var="c">
                                <tr>
                                    <td>${c.getAccount_id()}</td>
                                    <td>${c.getAccount_name()}</td>
                                    <td>${c.getFullname()}</td>
                                    <td>${c.getEmail()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.getGender() == 0}">Nam</c:when>
                                            <c:otherwise>Nữ</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${c.getAddress()}</td>
                                    <td>${roleMap[c.getRole_id()]}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="action-btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="user_update?id=${c.getAccount_id()}"><i class="fas fa-edit"></i> Edit</a>
                                                <a class="dropdown-item text-danger" href="#" onclick="doDelete(${c.getAccount_id()})"><i class="fas fa-trash-alt"></i> Delete</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
