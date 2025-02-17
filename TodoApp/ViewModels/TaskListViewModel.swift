import SwiftUI

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TodoTask] = []
    private let taskService: TaskServiceProtocol
    
    init(taskService: TaskServiceProtocol) {
        self.taskService = taskService
    }
    
    @MainActor
    func fetchTasks() async {
        do {
            tasks = try await taskService.fetchTasks()
        } catch {
            // Handle error appropriately
            print("Error fetching tasks: \(error)")
        }
    }
} 
