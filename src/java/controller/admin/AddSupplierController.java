/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.SuppliersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.time.ZoneId;
import model.Suppliers;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddSupplierController", urlPatterns = {"/admin/addSupplier"})
public class AddSupplierController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SuppliersDAO dbSupplier = new SuppliersDAO();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String supplyManager = request.getParameter("supplyManager");
        String address = request.getParameter("address");

        Suppliers foundSuppliers = dbSupplier.getSupplierByName(name);
        if (foundSuppliers != null) {
            response.setStatus(400);
            response.getWriter().write("Duplicate name of supplier");
        } else {
            Suppliers supplier = new Suppliers();
            supplier.setName(name);
            supplier.setEmail(email);
            supplier.setPhone(phone);
            supplier.setSupplyManager(supplyManager);
            supplier.setAddress(address);
            supplier.setCreatedAt(new Date());
            dbSupplier.addSupplier(supplier);
             response.setStatus(200);
        }
//        response.sendRedirect("suppliers");
    }

}
