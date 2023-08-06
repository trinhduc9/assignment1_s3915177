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

import Foundation
import SwiftUI
import CoreLocation

//team struct
struct Team: Identifiable, Codable{
    var id: Int
    var teamName: String
    var stadium: Stadium
    var shortDes: String
    var fullDes: String
    var region: String
    var achievement: Array<Int>
    var roster: Array<Player>
    var titleOdds: String
    var lastStanding: String
    var igURL: String
    var twURL: String
    
    var imageName: String
    var imageDarkName: String
    //convert name to image for more convinience use
    var image: Image {
        Image(imageName)
    }
    var imageDark: Image {
        Image(imageDarkName)
    }
    
    var coordinates: Coordinates
        
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
