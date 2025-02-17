//
//  PracticAppApp.swift
//  PracticApp
//
//  Created by Muhammad Riaz on 10/02/2025.
//

import SwiftUI

@main
struct TodoAppApp: App {
    // Create coordinator as a StateObject at app level
    @StateObject private var coordinator: MainCoordinator
    
    init() {
        // Initialize dependencies
        let taskService = TaskService()
        let viewModelFactory = ViewModelFactory(taskService: taskService)
        // Create coordinator with dependencies
        _coordinator = StateObject(wrappedValue: MainCoordinator(viewModelFactory: viewModelFactory))
    }
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
