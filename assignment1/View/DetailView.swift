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

struct DetailView: View {

    @EnvironmentObject var popupManager: PopupManager

    var team: Team
    var body: some View {
        ScrollView{
            ZStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text(team.teamName)
                        .bold()
                        .font(.system(size: 30))
                    TeamLogoView(image: team.image)
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack(alignment: .firstTextBaseline) {
                        Text("Description: ")
                        Text(team.fullDes)
                    }.alignmentGuide(.leading, computeValue: {
                        dimension in dimension[.leading]})
                    HStack{
                        Text("Home Court: ")
                        Text(team.stadium.stadiumName)
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Text("Court Address: ")
                        Text(team.stadium.address)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .frame(width: 250, height: 100)
                    }
                    MapPopupView(coordinate: team.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    HStack{
                        Text("Achievement: ")
                        AchievementView(team: team)
                    }
                    PlayerListView(team: team)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(team: teams[0])
            .environmentObject(PopupManager())
    }
}
