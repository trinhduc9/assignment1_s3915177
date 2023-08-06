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

//function to go to numbers of year won
func achieve(achievement: [Int]) -> String {
    var res = ""
    for year in achievement {
        res.append("🏆")
    }
    return res
}

//display the achievement
struct AchievementView: View {

    var team: Team

    var body: some View {
        let achievementRes = achieve(achievement: team.achievement)
        Text(achievementRes)
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView(team: teams[0])
    }
}
