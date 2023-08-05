/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 04/08/2023
 Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct PlayerListView: View {
    
    var team: Team
    let isDark: Bool
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(team.roster) {
                    player in
                    PlayerCard(isDark: isDark, player: player)
                }
            }
        }
    }
}


struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView(team: teams[0], isDark: true)
    }
}
