/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified: 05/08/2023
 Acknowledgement: Acknowledge the resources that you use here.
*/
import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var popupManager: PopupManager
    
    @State private var isDark = false
    @State private var searchText = ""
    @State private var selectedRegion = "All"
    
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
                    NavigationLink{
                        DetailView( isDark: isDark, team: team)
                            .environmentObject(popupManager)
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
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Looking for a specific team?")
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
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

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

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
