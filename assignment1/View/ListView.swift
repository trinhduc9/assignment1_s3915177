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

struct ListView: View {
    @AppStorage("isDarkMode") private var isDark = false
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
                                .foregroundColor(selectedRegion == region ? .white : .blue)
                                .background(selectedRegion == region ? Color.blue : Color.clear)
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
                                .foregroundColor(selectedRegion == region ? .white : .blue)
                                .background(selectedRegion == region ? Color.blue : Color.clear)
                                .cornerRadius(8)
                        }
                    }
                }
                List(searchResults){
                    //ForEach(searchResults) {
                    team in
                    NavigationLink{
                        DetailView(team: team)
                    } label: {
                        TeamCard(team: team)
                    }
                    //}
                    
                }
                .navigationTitle("NBA Teams")
                .toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                        Button(action: {
                            isDark.toggle()
                        },label: {
                            isDark ? Label("Dark", systemImage: "lightbulb.fill") : Label("Dark", systemImage: "lightbulb")
                        })
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
            return teams.filter { $0.teamName.localizedCaseInsensitiveContains(searchText) || $0.region.localizedCaseInsensitiveContains(searchText)}
        }
    }
}




struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
