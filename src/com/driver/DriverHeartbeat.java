package com.driver;
import java.io.IOException;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DriverHeartbeat")
public class DriverHeartbeat extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            String driverId = (String) session.getAttribute("did");

            if (driverId != null) {
                DatabaseConnection.insertUpdateFromSqlQuery(
                    "UPDATE tbldriver SET last_seen=NOW() WHERE driver_id='" + driverId + "'"
                );
            }
        }
    }
}