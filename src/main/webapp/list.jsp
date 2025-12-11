<%@ page language="java" import="java.util.*, com.todo.Task" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Tasks</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Your Tasks</h2>
        <div class="nav-links">
            <a href="add.jsp" class="btn">Add New Task</a>
        </div>
        <%
        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        if(tasks == null) {
            tasks = new ArrayList<>();
        }
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                if(tasks.isEmpty()) {
                %>
                <tr>
                    <td colspan="4" class="empty-message">No tasks yet. Add one!</td>
                </tr>
                <%
                } else {
                    for(Task t : tasks){
                %>
                <tr class="<%= t.isCompleted() ? "completed-task" : "" %>">
                    <td><%= t.getId() %></td>
                    <td><%= t.isCompleted() ? "<s>" + t.getTitle() + "</s>" : t.getTitle() %></td>
                    <td>
                        <% if(t.isCompleted()) { %>
                            <span class="status-completed">Completed</span>
                        <% } else { %>
                            <span class="status-pending">Pending</span>
                        <% } %>
                    </td>
                    <td>
                        <a href="complete?id=<%= t.getId() %>" class="complete-link">
                            <%= t.isCompleted() ? "Mark Incomplete" : "Mark Complete" %>
                        </a>
                        <a href="delete?id=<%= t.getId() %>" class="delete-link">Delete</a>
                    </td>
                </tr>
                <% 
                    }
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
