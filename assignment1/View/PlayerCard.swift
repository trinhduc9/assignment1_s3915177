/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified:
 Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct PlayerCard: View {
    var player: Player
    var body: some View {
        VStack {
            player.playerImage
                .resizable()
                .frame(width: 50, height: 50)
            Text(player.playerName)
            HStack{
                Text(player.number)
                Text(player.position)
            }
        }
    }
}

struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCard(team: teams[0])
    }
}
