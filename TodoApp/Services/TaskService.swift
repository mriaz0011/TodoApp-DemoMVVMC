import SwiftUI

protocol TaskServiceProtocol {
    func fetchTasks() async throws -> [TodoTask]
    func addTask(_ task: TodoTask) async throws
    func updateTask(_ task: TodoTask) async throws
    func deleteTask(_ id: UUID) async throws
}

class TaskService: TaskServiceProtocol {
    private let storage: TaskStorageProtocol
    
    init(storage: TaskStorageProtocol = TaskStorage()) {
        self.storage = storage
    }
    
    func fetchTasks() async throws -> [TodoTask] {
        try await storage.fetchTasks()
    }
    
    func addTask(_ task: TodoTask) async throws {
        var tasks = try await storage.fetchTasks()
        tasks.append(task)
        try await storage.save(tasks)
    }
    
    func updateTask(_ task: TodoTask) async throws {
        var tasks = try await storage.fetchTasks()
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            try await storage.save(tasks)
        }
    }
    
    func deleteTask(_ id: UUID) async throws {
        var tasks = try await storage.fetchTasks()
        tasks.removeAll { $0.id == id }
        try await storage.save(tasks)
    }
} 
