import SwiftUI

struct AnalyticsView: View {
    @StateObject var viewModel: AnalyticsViewModel
    
    var body: some View {
        List {
            Section("Task Statistics") {
                HStack {
                    Text("Completed Tasks")
                    Spacer()
                    Text("\(viewModel.completedTasksCount)")
                        .foregroundColor(.green)
                }
                
                HStack {
                    Text("Pending Tasks")
                    Spacer()
                    Text("\(viewModel.pendingTasksCount)")
                        .foregroundColor(.orange)
                }
            }
        }
        .task {
            await viewModel.fetchAnalytics()
        }
    }
} 