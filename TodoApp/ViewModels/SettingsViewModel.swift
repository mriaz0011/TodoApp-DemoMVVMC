import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var notificationsEnabled = false
    @Published var darkModeEnabled = false
    
    func toggleNotifications() {
        notificationsEnabled.toggle()
        // Implement notification settings
    }
    
    func toggleDarkMode() {
        darkModeEnabled.toggle()
        // Implement dark mode settings
    }
} 
