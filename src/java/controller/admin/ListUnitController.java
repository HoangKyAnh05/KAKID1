/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.UnitsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Units;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListUnitController", urlPatterns = {"/admin/units"})
public class ListUnitController extends HttpServlet {

    private final UnitsDAO dbUnit = new UnitsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        if (name == null) {
            name = "";
        }

        List<Units> units = dbUnit.getUnitsByName(name);

        request.setAttribute("name", name);
        request.setAttribute("units", units);
        request.getRequestDispatcher("unit-manager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
