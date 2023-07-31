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



func achieve(achievement: [Int]) -> String {
    var res = ""
    for year in achievement {
        res.append("🏆")
    }
    return res
}


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
