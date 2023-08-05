/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified: 05/08/2023
 Acknowledgement: https://www.youtube.com/watch?v=javFZbCYGfc
*/
import SwiftUI

struct DetailView: View {

    @EnvironmentObject var popupManager: PopupManager

    
    let isDark: Bool
    var team: Team
    var body: some View {
        ScrollView{
            ZStack(alignment: .center) {
                VStack{
                    Spacer()
                    Image(isDark ? team.imageDarkName : team.imageName)
                        .resizable()
                        .opacity(isDark ? 0.2 : 0.1)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(isDark ? team.imageDarkName : team.imageName)
                        .resizable()
                        .opacity(isDark ? 0.2 : 0.1)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(isDark ? team.imageDarkName : team.imageName)
                        .resizable()
                        .opacity(isDark ? 0.2 : 0.1)
                        .aspectRatio(contentMode: .fit)
                   Spacer()
                }
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                    Text(team.teamName)
                        .bold()
                        .font(.system(size: 30))
                    Spacer()
                        TeamLogoView(image: isDark ? team.imageDark : team.image)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    
                        TitleText(text: "Description")
                        Text(team.fullDes)
                        Spacer()
                    }
                    Group {
                        TitleText(text: "Home Court")
                        HStack{
                            Text(team.stadium.stadiumName)
                            Image(systemName:"square.and.arrow.up")
                                .foregroundColor(isDark ? .white : .black)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        popupManager.present()
                                    }
                                }
                        }
                    }
                    Group{
                        Text("📍") +
                        Text(team.stadium.address)
                        Spacer()
                    }
                    Group {
                        TitleText(text: "2023 Standing")
                        Text(team.lastStanding)
                        Spacer()
                    }
                    Group {
                        TitleText(text: "2024 Title Odd")
                        Text(team.titleOdds)
                        Spacer()
                    }
                    Group {
                        TitleText(text: "Achievements")
                        AchievementView(team: team)
                        Spacer()
                    }
                    Group{
                        TitleText(text: "Players")
                        PlayerListView(team: team, isDark: isDark)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Link(destination: URL(string: team.igURL)!) {
                            Image(isDark ? "igIcon-dark" : "igIcon")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        Link(destination: URL(string: team.twURL)!) {
                            Image(isDark ? "twIcon-dark" : "twIcon")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        Spacer()
                    }
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
                .onAppear{
                    if popupManager.action.isPresented {
                        popupManager.dismiss()
                    }
                }
                .ignoresSafeArea()
            }
        }.padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {

    static var previews: some View {
        DetailView(isDark: false, team: teams[0])
            .environmentObject(PopupManager())
    }
}
