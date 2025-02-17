import SwiftUI

struct TaskDetailView: View {
    @StateObject var viewModel: TaskDetailViewModel
    let coordinator: MainCoordinator
    
    var body: some View {
        List {
            Section("Task Details") {
                TextField("Title", text: $viewModel.title)
                TextEditor(text: $viewModel.description)
                    .frame(height: 100)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                Picker("Priority", selection: $viewModel.priority) {
                    Text("Low").tag(TodoTask.TaskPriority.low)
                    Text("Medium").tag(TodoTask.TaskPriority.medium)
                    Text("High").tag(TodoTask.TaskPriority.high)
                }
                Toggle("Completed", isOn: $viewModel.isCompleted)
            }
            
            Section("Actions") {
                Button(viewModel.isNewTask ? "Add Task" : "Update Task") {
                    Task {
                        await viewModel.saveTask()
                        coordinator.path.removeLast()
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(viewModel.isNewTask ? "New Task" : "Edit Task")
    }
} 
