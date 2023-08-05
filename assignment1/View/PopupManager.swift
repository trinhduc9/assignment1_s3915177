/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 29/07/2023
 Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation

final class PopupManager: ObservableObject {
    
    enum Action {
        case na
        case present
        case dismiss
    }

    @Published private(set) var action: Action = .na

    func present() {
        guard !action.isPresented else { return }
        self.action = .present
    }

    func dismiss() {
        self.action = .dismiss
    }
}

extension PopupManager.Action {
    var isPresented: Bool { self == .present }
}
