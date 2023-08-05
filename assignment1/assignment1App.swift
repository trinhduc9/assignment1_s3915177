/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified: 28/07/2023
 Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

@main
struct assignment1App: App {

    @StateObject var popupManager = PopupManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(popupManager)
        }
    }
}
