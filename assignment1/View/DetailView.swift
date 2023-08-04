/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified:
 Acknowledgement: https://www.youtube.com/watch?v=javFZbCYGfc
*/
import SwiftUI

struct DetailView: View {

    @EnvironmentObject var popupManager: PopupManager
    let isDark: Bool
    var team: Team
    var body: some View {
        ScrollView{
            ZStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(team.teamName)
                        .bold()
                        .font(.system(size: 30))
                    Spacer()
                    Group {
                    TeamLogoView(image: team.image)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    
                        TitleText(text: "Description ")
                        Text(team.fullDes)
                    }

                    HStack(alignment: .firstTextBaseline) {
                        TitleText(text: "Home Court: ")
                        Text(team.stadium.stadiumName)
                        
    
                        Image(systemName:"square.and.arrow.up")
                            .foregroundColor(isDark ? .white : .black)
                            .onTapGesture {
                                withAnimation(.spring().delay(0.25)) {
                                    popupManager.present()
                                }
                            }
                    }
                    HStack(alignment: .firstTextBaseline) {
                        TitleText(text: "📍")
                        Text(team.stadium.address)
                    }
                    HStack(alignment: .firstTextBaseline) {
                        TitleText(text: "2024 Title Odds: ")
                        Text(team.titleOdds)
                    }
                    HStack(alignment: .firstTextBaseline) {
                        TitleText(text: "Achievement: ")
                        AchievementView(team: team)
                    }
                    TitleText(text: "Players:")
                    PlayerListView(team: team, isDark: isDark)
                }
                .overlay{
                    if popupManager.action.isPresented {
                        MapPopupView(team: team){
                            withAnimation {
                                popupManager.dismiss()
                            }
                        }
                    }
                }
                .ignoresSafeArea()
            }.padding(.horizontal)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isDark: false, team: teams[18])
            .environmentObject(PopupManager())
    }
}
