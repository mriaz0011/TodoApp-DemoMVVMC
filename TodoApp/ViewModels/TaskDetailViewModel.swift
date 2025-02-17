import SwiftUI

class TaskDetailViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    @Published var priority: TodoTask.TaskPriority = .medium
    @Published var isCompleted: Bool = false
    
    private let taskService: TaskServiceProtocol
    private let existingTask: TodoTask?
    
    var isNewTask: Bool { existingTask == nil }
    
    init(task: TodoTask?, taskService: TaskServiceProtocol) {
        self.taskService = taskService
        self.existingTask = task
        
        if let task = task {
            self.title = task.title
            self.description = task.description
            self.dueDate = task.dueDate
            self.priority = task.priority
            self.isCompleted = task.isCompleted
        }
    }
    
    @MainActor
    func saveTask() async {
        let task = TodoTask(
            id: existingTask?.id ?? UUID(),
            title: title,
            description: description,
            isCompleted: isCompleted,
            dueDate: dueDate,
            priority: priority
        )
        
        do {
            if isNewTask {
                try await taskService.addTask(task)
            } else {
                try await taskService.updateTask(task)
            }
        } catch {
            print("Error saving task: \(error)")
        }
    }
} 
