import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var selectedTab: Tab = .tasks
    @Published var path = NavigationPath()
    
    let viewModelFactory: ViewModelFactoryProtocol
    
    init(viewModelFactory: ViewModelFactoryProtocol = ViewModelFactory()) {
        self.viewModelFactory = viewModelFactory
    }
    
    // MARK: - Navigation Methods
    func start() -> some View {
        NavigationStack(path: Binding(
            get: { [weak self] in
                self?.path ?? NavigationPath()
            },
            set: { [weak self] newPath in
                self?.path = newPath
            }
        )) {
            MainTabView(coordinator: self)
                .navigationDestination(for: Route.self) { [weak self] route in
                    self?.destinationView(for: route)
                }
        }
    }
    
    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .taskDetail(let task):
            showTaskDetail(task: task)
        case .settings:
            showSettings()
        }
    }
    
    @ViewBuilder
    private func showTaskDetail(task: TodoTask?) -> some View {
        TaskDetailView(
            viewModel: self.viewModelFactory.makeTaskDetailViewModel(task: task),
            coordinator: self
        )
    }
    
    @ViewBuilder
    private func showSettings() -> some View {
        SettingsView(
            viewModel: self.viewModelFactory.makeSettingsViewModel(),
            coordinator: self
        )
    }
    
    // MARK: - Navigation Actions
    func navigateToTaskDetail(_ task: TodoTask?) {
        path.append(Route.taskDetail(task))
    }
    
    func navigateToSettings() {
        path.append(Route.settings)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    // MARK: - Enums
    enum Tab {
        case tasks
        case analytics
    }
    
    enum Route: Hashable {
        case taskDetail(TodoTask?)
        case settings
        
        static func == (lhs: Route, rhs: Route) -> Bool {
            switch (lhs, rhs) {
            case (.settings, .settings):
                return true
            case let (.taskDetail(lhsTask), .taskDetail(rhsTask)):
                return lhsTask?.id == rhsTask?.id
            default:
                return false
            }
        }
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .settings:
                hasher.combine(0)
            case .taskDetail(let task):
                hasher.combine(1)
                hasher.combine(task?.id)
            }
        }
    }
} 
