
<!-- Google Fonts: Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/style.css">

<?php
require_once 'config/database.php';

if (!isset($_SESSION['user_id']) || !isset($_GET['id'])) {
    header('Location: dashboard.php');
    exit();
}

$task_id = $_GET['id'];

// Mark task as completed
$stmt = $pdo->prepare("UPDATE tasks SET status = 'completed' WHERE id = ? AND user_id = ?");

if ($stmt->execute([$task_id, $_SESSION['user_id']])) {
    if ($stmt->rowCount() > 0) {
        $_SESSION['success'] = 'Task marked as completed!';
    } else {
        $_SESSION['error'] = 'Task not found or you don\'t have permission to update it.';
    }
} else {
    $_SESSION['error'] = 'Failed to update task. Please try again.';
}

header('Location: dashboard.php');
exit();
?>