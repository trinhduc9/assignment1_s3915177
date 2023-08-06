/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 29/07/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import Foundation

final class PopupManager: ObservableObject {
    
    enum Action {
        case na
        case present
        case dismiss
    }

    @Published private(set) var action: Action = .na

    //display map popup
    func present() {
        guard !action.isPresented else { return }
        self.action = .present
    }

    //close map popup
    func dismiss() {
        self.action = .dismiss
    }
}

extension PopupManager.Action {
    var isPresented: Bool { self == .present }
}
