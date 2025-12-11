package com.todo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CompleteTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String idParam = req.getParameter("id");
            if(idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                TaskServlet.tasks.stream()
                    .filter(t -> t.getId() == id)
                    .findFirst()
                    .ifPresent(task -> task.setCompleted(!task.isCompleted()));
            }
        } catch (NumberFormatException e) {
            // Invalid ID format, just redirect
        }
        resp.sendRedirect("tasks");
    }
}

