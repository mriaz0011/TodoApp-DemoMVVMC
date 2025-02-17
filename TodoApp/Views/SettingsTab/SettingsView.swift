import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    let coordinator: MainCoordinator
    
    var body: some View {
        List {
            Section("Preferences") {
                Toggle("Enable Notifications", isOn: $viewModel.notificationsEnabled)
                    .onChange(of: viewModel.notificationsEnabled) { newValue in
                        viewModel.toggleNotifications()
                    }
                
                Toggle("Dark Mode", isOn: $viewModel.darkModeEnabled)
                    .onChange(of: viewModel.darkModeEnabled) { newValue in
                        viewModel.toggleDarkMode()
                    }
            }
        }
        .navigationTitle("Settings")
    }
} 