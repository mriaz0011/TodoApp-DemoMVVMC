import SwiftUI

protocol TaskStorageProtocol {
    func fetchTasks() async throws -> [TodoTask]
    func save(_ tasks: [TodoTask]) async throws
}

class TaskStorage: TaskStorageProtocol {
    private let userDefaults = UserDefaults.standard
    private let key = "tasks"
    
    func fetchTasks() async throws -> [TodoTask] {
        guard let data = userDefaults.data(forKey: key) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([TodoTask].self, from: data)
        } catch {
            throw error
        }
    }
    
    func save(_ tasks: [TodoTask]) async throws {
        do {
            let data = try JSONEncoder().encode(tasks)
            userDefaults.set(data, forKey: key)
        } catch {
            throw error
        }
    }
} 
