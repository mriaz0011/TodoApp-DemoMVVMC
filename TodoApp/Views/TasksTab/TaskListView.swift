import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel: TaskListViewModel
    let coordinator: MainCoordinator
    
    var body: some View {
        List {
            ForEach(viewModel.tasks) { task in
                TaskRowView(task: task)
                    .onTapGesture {
                        coordinator.path.append(MainCoordinator.Route.taskDetail(task))
                    }
            }
        }
        .navigationTitle("Tasks")
        .toolbar {
            Button("Add") {
                coordinator.path.append(MainCoordinator.Route.taskDetail(nil))
            }
        }
        .task {
            await viewModel.fetchTasks()
        }
        .onChange(of: coordinator.path) { _ in
            Task {
                await viewModel.fetchTasks()
            }
        }
    }
} 
