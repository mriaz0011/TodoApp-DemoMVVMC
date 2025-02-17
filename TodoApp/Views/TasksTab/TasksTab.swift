import SwiftUI

struct TasksTab: View {
    let coordinator: MainCoordinator
    @StateObject private var viewModel: TaskListViewModel
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        _viewModel = StateObject(wrappedValue: coordinator.viewModelFactory.makeTaskListViewModel())
    }
    
    var body: some View {
        TaskListView(viewModel: viewModel, coordinator: coordinator)
    }
} 
