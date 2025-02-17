import SwiftUI

struct TodoTask: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var isCompleted: Bool
    var dueDate: Date
    var priority: TaskPriority
    
    enum TaskPriority: String, Codable {
        case low, medium, high
    }
} 
