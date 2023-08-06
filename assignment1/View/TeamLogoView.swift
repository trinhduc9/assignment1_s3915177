/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 31/07/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import SwiftUI

//Display logo on detailview
struct TeamLogoView: View {

    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .shadow(color: Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.6), radius: 10, x: 0, y: 10)
            
    }
}

struct TeamLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamLogoView(image: Image("Netslogo"))
    }
}
