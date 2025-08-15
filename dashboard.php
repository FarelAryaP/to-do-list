<?php
require_once 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit();
}

// Get user's tasks
$stmt = $pdo->prepare("SELECT * FROM tasks WHERE user_id = ? ORDER BY deadline ASC, priority DESC, created_at DESC");
$stmt->execute([$_SESSION['user_id']]);
$tasks = $stmt->fetchAll();

$page_title = 'Dashboard - ToDo App';
include 'includes/header.php';
?>

<!-- Google Fonts: Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/style.css">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="dashboard.php">
            <i class="fas fa-tasks"></i> To-Do App
        </a>
        <div class="navbar-nav ms-auto">
            <span class="navbar-text me-3" style="color:#ffffff">
                Welcome aboard, <?php echo htmlspecialchars($_SESSION['username']); ?>!
            </span>
            <a class="nav-link" href="logout.php">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <?php if (isset($_SESSION['success'])): ?>
        <div class="alert alert-success alert-dismissible fade show">
            <?php echo $_SESSION['success']; unset($_SESSION['success']); ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <?php endif; ?>
    
    <?php if (isset($_SESSION['error'])): ?>
        <div class="alert alert-danger alert-dismissible fade show">
            <?php echo $_SESSION['error']; unset($_SESSION['error']); ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <?php endif; ?>

    <div class="row">
        <div class="col-md-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2><i class="fas fa-list"></i> My Tasks</h2>
                <a href="add_task.php" class="btn btn-success">
                    <i class="fas fa-plus"></i> Add New Task
                </a>
            </div>
            
            <?php if (empty($tasks)): ?>
                <div class="text-center py-5">
                    <i class="fas fa-clipboard-list fa-4x text-muted mb-3"></i>
                    <h4 class="text-muted">No tasks yet</h4>
                    <p class="text-muted">Start by adding your first task!</p>
                    <a href="add_task.php" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Add Task
                    </a>
                </div>
            <?php else: ?>
                <div class="row">
                    <?php foreach ($tasks as $task): ?>
                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card task-card priority-<?php echo $task['priority']; ?> <?php echo $task['status'] == 'completed' ? 'task-completed' : ''; ?>">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="card-title mb-0">
                                            <?php echo htmlspecialchars($task['title']); ?>
                                        </h6>
                                        <span class="badge bg-<?php echo $task['priority'] == 'high' ? 'danger' : ($task['priority'] == 'medium' ? 'warning' : 'success'); ?>">
                                            <?php echo ucfirst($task['priority']); ?>
                                        </span>
                                    </div>
                                    
                                    <?php if (!empty($task['description'])): ?>
                                        <p class="card-text small text-muted">
                                            <?php echo htmlspecialchars($task['description']); ?>
                                        </p>
                                    <?php endif; ?>
                                    
                                    <?php if ($task['deadline']): ?>
                                        <p class="card-text">
                                            <small class="text-muted">
                                                <i class="fas fa-calendar"></i> 
                                                <?php echo date('M d, Y', strtotime($task['deadline'])); ?>
                                            </small>
                                        </p>
                                    <?php endif; ?>
                                    
                                    <div class="btn-group btn-group-sm w-100" role="group">
                                        <?php if ($task['status'] == 'pending'): ?>
                                            <a href="mark_done.php?id=<?php echo $task['id']; ?>" class="btn btn-outline-success" title="Mark as Done">
                                                <i class="fas fa-check"></i>
                                            </a>
                                        <?php else: ?>
                                            <span class="btn btn-success disabled">
                                                <i class="fas fa-check"></i> Done
                                            </span>
                                        <?php endif; ?>
                                        
                                        <a href="edit_task.php?id=<?php echo $task['id']; ?>" class="btn btn-outline-primary" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        
                                        <a href="delete_task.php?id=<?php echo $task['id']; ?>" class="btn btn-outline-danger" 
                                           onclick="return confirm('Are you sure you want to delete this task?')" title="Delete">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>