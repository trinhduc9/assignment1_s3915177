/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified: 29/07/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import SwiftUI

struct ContentView: View {

    @State var isWelcomeActive: Bool = true
    @EnvironmentObject var popupManager: PopupManager

    var body: some View {
        ZStack {
            if isWelcomeActive { //Default welcome view
                WelcomeView(active: $isWelcomeActive)
            } else {
                ListView() 
                    .environmentObject(popupManager) //Pass the popup manager to listview
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
