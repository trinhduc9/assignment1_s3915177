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
    var body: some View {
        NavigationView {
            List(teams){
                ForEach(searchResults) {team in
                    NavigationLink{
                        DetailView(team: team)
                    } label: {
                        TeamCard(team: team)
                    }
                }
                .toolbar{
                    ToobarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                        Button(action: {
                            isDark.toggle()
                        },label: {
                            isDark ? Label("Dark", systemImage: "lightbulb.fill") : Label("Dark", systemImage: "lightbulb")
                        })
                    }
                }
                .environment(\.colorScheme, isDark ? .dark : .light)
                .navigationTitle("NBA Teams")
            }
        }.searchable(text: $searchText, prompt: "Looking for a specific team?", placement: .navigationBarDrawer(displayMode: .always))
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}




struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
