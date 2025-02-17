import SwiftUI

protocol ViewModelFactoryProtocol {
    func makeTaskListViewModel() -> TaskListViewModel
    func makeTaskDetailViewModel(task: TodoTask?) -> TaskDetailViewModel
    func makeAnalyticsViewModel() -> AnalyticsViewModel
    func makeSettingsViewModel() -> SettingsViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    private let taskService: TaskServiceProtocol
    
    init(taskService: TaskServiceProtocol = TaskService()) {
        self.taskService = taskService
    }
    
    func makeTaskListViewModel() -> TaskListViewModel {
        TaskListViewModel(taskService: taskService)
    }
    
    func makeTaskDetailViewModel(task: TodoTask?) -> TaskDetailViewModel {
        TaskDetailViewModel(task: task, taskService: taskService)
    }
    
    func makeAnalyticsViewModel() -> AnalyticsViewModel {
        AnalyticsViewModel(taskService: taskService)
    }
    
    func makeSettingsViewModel() -> SettingsViewModel {
        SettingsViewModel()
    }
} 
