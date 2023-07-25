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

import Foundation
import SwiftUI
import CoreLocation

struct Team: Identifiable, Codable{
    var id: Int
    var teamName: String
    var stadium: Stadium
    var shortDes: String
    var fullDes: String
    var achievement: Array<Int>
    var roster: Array<Player>
    
    var imageName: String
        var image: Image {
            Image(imageName)
        }
    
    var coordinates: Coordinates
        
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
