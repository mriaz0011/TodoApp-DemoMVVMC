import SwiftUI

struct TaskRowView: View {
    let task: TodoTask
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.headline)
            Text(task.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack {
                Text(task.dueDate, style: .date)
                    .font(.caption)
                Spacer()
                PriorityBadge(priority: task.priority)
            }
        }
    }
}

struct PriorityBadge: View {
    let priority: TodoTask.TaskPriority
    
    var body: some View {
        Text(priority.rawValue.capitalized)
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(priorityColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    private var priorityColor: Color {
        switch priority {
        case .low: return .green
        case .medium: return .orange
        case .high: return .red
        }
    }
} 
