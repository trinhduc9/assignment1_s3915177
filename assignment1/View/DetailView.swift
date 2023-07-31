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
        ZStack{
            VStack{
                Text(team.teamName)
                TeamLogoView(image: team.image)
                HStack{
                    Text("Description: ")
                    Text(team.fullDes)
                }
                HStack{
                    Text("Home Court: ")
                    Text(team.stadium.stadiumName)
                }
                HStack{
                    Text("Court Address: ")
                    Text(team.stadium.address)
    
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(team: teams[0])
            .environmentObject(PopupManager())
    }
}
