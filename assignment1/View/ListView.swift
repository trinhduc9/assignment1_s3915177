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
    var body: some View {
        NavigationView {
            List(teams){
                team in
                NavigationLink{
                    DetailView(team: team)
                } label: {
                    TeamCard(team: team)
                }
                .navigationTitle("NBA Teams")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
