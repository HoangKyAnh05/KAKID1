/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.SuppliersDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Suppliers;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListSupplierController", urlPatterns = {"/admin/suppliers"})
public class ListSupplierController extends HttpServlet {

    private final SuppliersDAO dbSupplier = new SuppliersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String supplyManager = request.getParameter("supplyManager");
        String address = request.getParameter("address");

        // name like %%, %a, a%, _a%,
        if (name == null) {
            name = "";
        }
        if (email == null) {
            email = "";
        }
        if (phone == null) {
            phone = "";
        }
        if (supplyManager == null) {
            supplyManager = "";
        }
        if (address == null) {
            address = "";
        }

        List<Suppliers> suppliers = dbSupplier.getSuppliersWithSearch(name, email, phone, supplyManager, address);

        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("supplyManager", supplyManager);
        request.setAttribute("address", address);
        request.setAttribute("suppliers", suppliers);
        request.getRequestDispatcher("supplier-manager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
