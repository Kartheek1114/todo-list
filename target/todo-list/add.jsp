<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Task</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Add Task</h2>
        <form action="tasks" method="post">
            <div class="form-group">
                <input type="text" name="title" placeholder="Enter task title" required>
            </div>
            <button type="submit">Add Task</button>
        </form>
        <div class="nav-links">
            <a href="tasks" class="btn btn-secondary">Back to Tasks</a>
        </div>
    </div>
</body>
</html>
