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

struct DetailView: View {

    @EnvironmentObject var popupManager: PopupManager

    
    let isDark: Bool
    var team: Team
    var body: some View {
        ScrollView{
            ZStack(alignment: .center) { //To implement map popup and background
                VStack{ //background
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
                        //Team name 
                        Text(team.teamName)
                            .bold()
                            .font(.system(size: 30))
                        Spacer()
                        //Team logo
                        TeamLogoView(image: isDark ? team.imageDark : team.image)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        //Team's description
                        TitleText(text: "Description")
                        Text(team.fullDes)
                        Spacer()
                    }
                    Group {
                        TitleText(text: "Home Court")
                        HStack{
                            Text(team.stadium.stadiumName)
                            //Popup map from icon
                            Image(systemName:"square.and.arrow.up")
                                .foregroundColor(isDark ? .white : .black)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        popupManager.present()
                                    }
                                }
                        }
                    }
                    //Court address
                    Group{
                        Text("📍") +
                        Text(team.stadium.address)
                        Spacer()
                    }
                    //Last season standing
                    Group {
                        TitleText(text: "2023 Standing")
                        Text(team.lastStanding)
                        Spacer()
                    }
                    //Next season odd of winning the league
                    Group {
                        TitleText(text: "2024 Title Odd")
                        Text(team.titleOdds)
                        Spacer()
                    }
                    //Achievement display
                    Group {
                        TitleText(text: "Achievements")
                        AchievementView(team: team)
                        Spacer()
                    }
                    //Display team's roster
                    Group{
                        TitleText(text: "Players")
                        PlayerListView(team: team, isDark: isDark)
                        Spacer()
                    }
                    //Social media redirect
                    HStack {
                        Spacer()
                        //Instagram
                        Link(destination: URL(string: team.igURL)!) {
                            Image(isDark ? "igIcon-dark" : "igIcon")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        //Twitter
                        Link(destination: URL(string: team.twURL)!) {
                            Image(isDark ? "twIcon-dark" : "twIcon")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        Spacer()
                    }
                }
                .overlay{ //Map dismiss on btn click
                    if popupManager.action.isPresented {
                        MapPopupView(team: team){
                            withAnimation {
                                popupManager.dismiss()
                            }
                        }
                    }
                }
                .onAppear{ //Dismiss a map when get in detail view
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
