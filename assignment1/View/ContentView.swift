/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified:
 Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct ContentView: View {
    @State var isWelcomeActive: Bool = true
    @EnvironmentObject var popupManager: PopupManager
    var body: some View {
        ZStack {
            if isWelcomeActive {
                WelcomeView(active: $isWelcomeActive)
            } else {
                ListView()
                    .environmentObject(popupManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PopupManager())
    }
}
