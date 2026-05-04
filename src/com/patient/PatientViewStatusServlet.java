package com.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PatientViewStatus")
public class PatientViewStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("patient_id") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String avn = null;
        String status = null;

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM tblpatient WHERE patient_id=? ORDER BY created_at DESC LIMIT 1")) {

            ps.setInt(1, (Integer) session.getAttribute("patient_id"));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                avn = rs.getString("avn");
                status = rs.getString("ambulance_status");

                request.setAttribute("patientData", rs);
            }

            request.setAttribute("avn", avn);
            request.setAttribute("status", status);

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("patient-view-ambulance-status.jsp")
               .forward(request, response);
    }
}