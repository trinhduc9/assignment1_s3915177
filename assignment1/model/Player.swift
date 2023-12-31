/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified: 31/07/2023
 Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation
import SwiftUI
import CoreLocation

//Struct for the roster
struct Player: Identifiable, Codable{
    var id: Int
    var playerName: String
    var position: String
    var playerImageName: String
    var playerImage :Image {
        Image(playerImageName)
    } 
}
