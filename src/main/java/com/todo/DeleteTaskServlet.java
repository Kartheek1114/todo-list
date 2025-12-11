package com.todo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String idParam = req.getParameter("id");
            if(idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                TaskServlet.tasks.removeIf(t -> t.getId() == id);
            }
        } catch (NumberFormatException e) {
            // Invalid ID format, just redirect
        }
        resp.sendRedirect("tasks");
    }
}
