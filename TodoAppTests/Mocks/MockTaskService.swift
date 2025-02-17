import SwiftUI

class MockTaskService: TaskServiceProtocol {
    var mockTasks: [Task] = []
    var fetchTasksCalled = false
    
    func fetchTasks() async throws -> [Task] {
        fetchTasksCalled = true
        return mockTasks
    }
    
    // Other mock implementations
} 
