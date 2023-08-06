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

struct ListView: View {
    
    @EnvironmentObject var popupManager: PopupManager
    
    @State private var isDark = false
    @State private var searchText = ""
    @State private var selectedRegion = "All"
    
    //Regions for filter
    let regions = ["All", "Pacific", "Atlantic", "Central", "South-east", "South-west", "North-west"]
    var regionsInLine1: [String] {
            Array(regions.prefix(3))
        }
    var regionsInLine2: [String] {
        Array(regions.suffix(4))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    ForEach(regionsInLine1, id: \.self) { region in
                        Button(action: {
                            selectedRegion = region
                        }) {
                            Text(region)
                                .padding(5)
                                .foregroundColor(selectedRegion == region ? (isDark ? Color.black : Color.white) : (isDark ? Color.white : Color.black))
                                .background(selectedRegion == region ? (isDark ? Color.white : Color.black) : Color.clear)
                                .cornerRadius(8)
                        }
                    }
                }
                HStack {
                    ForEach(regionsInLine2, id: \.self) { region in
                        Button(action: {
                            selectedRegion = region
                        }) {
                            Text(region)
                                .padding(5)
                                .foregroundColor(selectedRegion == region ? (isDark ? Color.black : Color.white) : (isDark ? Color.white : Color.black))
                                .background(selectedRegion == region ? (isDark ? Color.white : Color.black) : Color.clear)
                                .cornerRadius(8)
                        }
                    }
                }
                List(searchResults){ 
                    team in
                    NavigationLink{ //Navigation to detail view
                        DetailView( isDark: isDark, team: team)
                            .environmentObject(popupManager) //Pass the popup manager to detailview
                    } label: {
                        TeamCard(isDark: isDark, team: team)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("NBA Teams")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(isDark ? .white : .black)
                        Spacer()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isDark.toggle()
                        }) {
                            Image(systemName: isDark ? "moon.fill" : "sun.max")
                                .foregroundColor(isDark ? .white : .black)
                        }
                    }
                }
            }
        }
        //Search bar
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Looking for a specific team?")
        //Pass the dark/light mode status to the whole app
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
    //Search filter
    var searchResults: [Team] {
        if selectedRegion != "All" {
            return teams.filter { $0.region == selectedRegion }
        }
        else if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { $0.teamName.lowercased().contains(searchText.lowercased()) }
        }
    }
}
//Eliminate the gap of navigation view
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}
//Eliminate the gap of navigation view
extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(PopupManager())
    }
}
