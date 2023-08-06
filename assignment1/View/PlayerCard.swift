/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 04/08/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import SwiftUI

struct PlayerCard: View {

    let isDark: Bool
    var player: Player

    var body: some View {
        VStack{
            TitleText(text: player.playerName)
            player.playerImage
                .resizable()
                .frame(width: 135, height: 100)
                .foregroundColor(Color.white)
            HStack {
                Spacer()
                TitleText(text: String(player.id))
                Spacer()
                TitleText(text: player.position)
                Spacer()
            }
        }.frame(width: 150, height: 165)
            .border(isDark ? Color.white : Color.black, width: 1)
    }
}

struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCard( isDark: true, player: teams[0].roster[0])    }
}
