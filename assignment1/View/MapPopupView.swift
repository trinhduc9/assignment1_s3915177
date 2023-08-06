/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 31/07/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import SwiftUI
import MapKit

struct MapPopupView: View {

    var team : Team
    let didClose: () -> Void
    @State private var region = MKCoordinateRegion()

    var body: some View {
        VStack{
            Map(coordinateRegion: $region,
            annotationItems: [team]){
                team in
                MapAnnotation(coordinate: team.locationCoordinate) {
                    MapAnnotationView()
                }
            }
            .edgesIgnoringSafeArea(.top)
            .frame(height: 350)
            .onAppear {
                setRegion(team: team)
            }
        }.border(Color.black)
        .overlay(alignment: .topTrailing){
            close
        }.transition(.move(edge: .bottom))
    }
    private func setRegion(team: Team) {
        region = MKCoordinateRegion(
            center: team.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

private extension MapPopupView {
    var close: some View {
        Button{
            didClose()
        }label: {
            Image(systemName: "xmark")
                .symbolVariant(.circle.fill)
                .font(
                    .system(size: 20,
                            weight: .bold,
                            design: .rounded)
                )
                .foregroundStyle(.gray.opacity(0.8))
                .padding(8)
        }
    }
}

struct MapPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MapPopupView(team: teams[0]){}
    }
}
