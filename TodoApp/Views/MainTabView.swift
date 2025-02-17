import SwiftUI

struct MainTabView: View {
    @StateObject var coordinator: MainCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            TasksTab(coordinator: coordinator)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
                .tag(MainCoordinator.Tab.tasks)
            
            AnalyticsTab(coordinator: coordinator)
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }
                .tag(MainCoordinator.Tab.analytics)
        }
    }
} 

#Preview {
    let taskService = TaskService()
    let viewModelFactory = ViewModelFactory(taskService: taskService)
    // Create coordinator with dependencies
    let coordinator = MainCoordinator(viewModelFactory: viewModelFactory)
    MainTabView(coordinator: coordinator)
}
