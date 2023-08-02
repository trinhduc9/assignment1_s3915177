/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified:
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
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
        }.overlay(alignment: .topTrailing){
            close
        }.transition(.move(edge: .bottom))
    }
    private func setRegion(team: Team) {
        region = MKCoordinateRegion(
            center: team.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
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
