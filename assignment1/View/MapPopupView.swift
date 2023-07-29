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
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    var body: some View {
        VStack{
            Map(coordinateRegion: $region)
                .onAppear {
                    setRegion(coordinate)
                }
        }.overlay(alignment: .topTrailing) {
            close
        }
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

private extension MapPopupView {
    var close: some View {
        Button{
            label: {
                Image(systemName: "xmark")
                    .symbolVariant(.circle.fill)
                    .font(
                        .system(size: 20,
                                weight: .bold,
                                design: .rounded)
                    )
                    .foregroundStyle(.gray.opcatity(0.4))
                    .padding(8)
            }
        }
    }
}

struct MapPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MapPopupView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}