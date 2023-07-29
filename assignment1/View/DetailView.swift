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
                Image(team.image)
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
                    Image(systemName: "square.and.arrow.up") 
                        .resizable()
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            withAnimation{
                                popupManager.present()
                            }
                        }
                }
                HStack{
                    Text("Achievement: ")
                    AchievementView(team)
                }
                PlayerListView(team)
            }
        }
        .overlay(alignment: .bottom) {
            if popupManager.action.isPresented {
                MapPopupView {
                    withAnimation {
                        popupManager.dismiss()
                    }
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
