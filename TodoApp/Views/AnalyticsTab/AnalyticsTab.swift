import SwiftUI

struct AnalyticsTab: View {
    let coordinator: MainCoordinator
    @StateObject private var viewModel: AnalyticsViewModel
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        _viewModel = StateObject(wrappedValue: coordinator.viewModelFactory.makeAnalyticsViewModel())
    }
    
    var body: some View {
        NavigationView {
            AnalyticsView(viewModel: viewModel)
                .navigationTitle("Analytics")
        }
    }
} 
