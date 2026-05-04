package com.driver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DatabaseConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckActiveTrip")
public class CheckActiveTrip extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        response.setContentType("application/json");

        if (session == null || session.getAttribute("avn") == null) {
            response.getWriter().write("{\"active\":false}");
            return;
        }

        String avn = (String) session.getAttribute("avn");

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT ambulance_status FROM tblpatient " +
                 "WHERE avn=? AND ambulance_status IN ('On the way','Pickup')")) {

            ps.setString(1, avn);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                response.getWriter().write("{\"active\":true}");
            } else {
                response.getWriter().write("{\"active\":false}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"active\":false}");
        }
    }
}