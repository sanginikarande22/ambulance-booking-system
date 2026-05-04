package com.driver;  

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetDriverLocation")
public class GetDriverLocation extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String avn = request.getParameter("avn");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // Basic validation
        if (avn == null || avn.trim().isEmpty()) {
            out.write("{}");
            return;
        }

        try (Connection con = DatabaseConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(
        			    "SELECT dl.latitude, dl.longitude, dl.updated_at, " +
        			    "d.login_status, d.last_seen " +
        			    "FROM tbldriverlocation dl " +
        			    "INNER JOIN tblambulance a ON dl.avn = a.ambulance_vehicle_no " +
        			    "INNER JOIN tbldriver d ON a.driver_name = d.driver_name " +
        			    "WHERE dl.avn = ? LIMIT 1"
        			)) {

        	
            ps.setString(1, avn);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	    double lat = rs.getDouble("latitude");
                double lng = rs.getDouble("longitude");
                String updatedAt = rs.getString("updated_at");
                String loginStatus = rs.getString("login_status");
                String lastSeen = rs.getString("last_seen");

                out.write("{");
                out.write("\"lat\":" + lat + ",");
                out.write("\"lng\":" + lng + ",");
                out.write("\"updated_at\":\"" + updatedAt + "\",");
                out.write("\"login_status\":\"" + loginStatus + "\",");
                out.write("\"last_seen\":\"" + lastSeen + "\"");
                out.write("}");

            } else {
                out.write("{}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.write("{}");
        }

        out.flush();
    }
}