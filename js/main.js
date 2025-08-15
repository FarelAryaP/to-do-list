// document.addEventListener("DOMContentLoaded", function () {
  // Auto-hide alerts after 5 seconds
  // const alerts = document.querySelectorAll(".alert:not(.alert-permanent)");
  // alerts.forEach(function (alert) {
  //   setTimeout(function () {
  //     const bsAlert = new bootstrap.Alert(alert);
  //     bsAlert.close();
  //   }, 5000);
  // });

//   // Task card hover effects
//   const taskCards = document.querySelectorAll(".task-card");
//   taskCards.forEach(function (card) {
//     card.addEventListener("mouseenter", function () {
//       this.style.transform = "translateY(-5px)";
//     });

//     card.addEventListener("mouseleave", function () {
//       this.style.transform = "translateY(0)";
//     });
//   });

//   // Form validation
//   const forms = document.querySelectorAll("form");
//   forms.forEach(function (form) {
//     form.addEventListener("submit", function (e) {
//       const requiredFields = form.querySelectorAll("[required]");
//       let isValid = true;

//       requiredFields.forEach(function (field) {
//         if (!field.value.trim()) {
//           isValid = false;
//           field.classList.add("is-invalid");
//         } else {
//           field.classList.remove("is-invalid");
//         }
//       });

//       if (!isValid) {
//         e.preventDefault();
//         showAlert("Please fill in all required fields.", "danger");
//       }
//     });
//   });

//   // Deadline warning
//   const deadlineInputs = document.querySelectorAll('input[type="date"]');
//   deadlineInputs.forEach(function (input) {
//     input.addEventListener("change", function () {
//       const selectedDate = new Date(this.value);
//       const today = new Date();
//       const diffTime = selectedDate - today;
//       const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

//       if (diffDays < 0) {
//         showAlert("Warning: You selected a past date!", "warning");
//       } else if (diffDays <= 3 && diffDays >= 0) {
//         showAlert("Note: This deadline is coming soon!", "info");
//       }
//     });
//   });

//   // Priority color preview
//   const prioritySelects = document.querySelectorAll('select[name="priority"]');
//   prioritySelects.forEach(function (select) {
//     updatePriorityColor(select);
//     select.addEventListener("change", function () {
//       updatePriorityColor(this);
//     });
//   });

//   function updatePriorityColor(select) {
//     const value = select.value;
//     select.className = "form-select";

//     if (value === "high") {
//       select.classList.add("border-danger");
//     } else if (value === "medium") {
//       select.classList.add("border-warning");
//     } else if (value === "low") {
//       select.classList.add("border-success");
//     }
//   }

//   function showAlert(message, type) {
//     // Remove existing temporary alerts
//     const existingAlerts = document.querySelectorAll(".temp-alert");
//     existingAlerts.forEach((alert) => alert.remove());

//     // Create new alert
//     const alertDiv = document.createElement("div");
//     alertDiv.className = `alert alert-${type} alert-dismissible fade show temp-alert`;
//     alertDiv.innerHTML = `
//             ${message}
//             <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
//         `;

//     // Insert at the top of the container
//     const container = document.querySelector(".container");
//     if (container) {
//       container.insertBefore(alertDiv, container.firstChild);
//     }

//     // Auto-hide after 4 seconds
//     setTimeout(function () {
//       if (alertDiv.parentNode) {
//         const bsAlert = new bootstrap.Alert(alertDiv);
//         bsAlert.close();
//       }
//     }, 4000);
//   }
// });

// // Confirmation for delete actions
// function confirmDelete(taskTitle) {
//   return confirm(`Are you sure you want to delete the task: "${taskTitle}"?`);
// }

// // Task statistics (for future enhancement)
// function updateTaskStats() {
//   const totalTasks = document.querySelectorAll(".task-card").length;
//   const completedTasks = document.querySelectorAll(".task-completed").length;
//   const pendingTasks = totalTasks - completedTasks;

//   // This could be used to show statistics in the dashboard
//   console.log(
//     `Total: ${totalTasks}, Completed: ${completedTasks}, Pending: ${pendingTasks}`
//   );
// }
