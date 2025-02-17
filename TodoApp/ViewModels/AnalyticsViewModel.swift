import SwiftUI

class AnalyticsViewModel: ObservableObject {
    @Published var completedTasksCount = 0
    @Published var pendingTasksCount = 0
    private let taskService: TaskServiceProtocol
    
    init(taskService: TaskServiceProtocol) {
        self.taskService = taskService
    }
    
    @MainActor
    func fetchAnalytics() async {
        do {
            let tasks = try await taskService.fetchTasks()
            completedTasksCount = tasks.filter { $0.isCompleted }.count
            pendingTasksCount = tasks.filter { !$0.isCompleted }.count
        } catch {
            // Handle error
            print("Error fetching analytics: \(error)")
        }
    }
} 
