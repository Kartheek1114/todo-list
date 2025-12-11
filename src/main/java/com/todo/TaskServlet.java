package com.todo;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class TaskServlet extends HttpServlet {
    public static List<Task> tasks = new ArrayList<>();
    private static int counter = 1;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("tasks", tasks);
        req.getRequestDispatcher("/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String title = req.getParameter("title");
        tasks.add(new Task(counter++, title));
        resp.sendRedirect("tasks");
    }
}
