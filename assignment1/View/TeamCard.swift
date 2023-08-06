/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified: 05/08/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import SwiftUI

//Display of teams on listview
struct TeamCard: View {

    let isDark : Bool
    var team: Team

    var body: some View {
        HStack {
            (isDark ? team.imageDark : team.image)
                .resizable()
                .frame(width: 75, height: 75)
            VStack(alignment: .leading, spacing: 10){
                Text(team.teamName)
                    .font(.system(size: 20))
                    .bold()
                    .alignmentGuide(.leading, computeValue: {
                        dimension in dimension[.leading]})
                Text(team.shortDes)
            }
        }
    }
}

struct TeamCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamCard(isDark: false, team: teams[0])
    }
}
