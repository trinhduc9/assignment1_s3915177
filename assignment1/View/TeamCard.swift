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

struct TeamCard: View {
    var team: Team
    var body: some View {
        HStack {
            team.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack{
                Text(team.teamName)
                Text(team.shortDes)
            }
        }
    }
}

struct TeamCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamCard(team: teams[0])
    }
}
