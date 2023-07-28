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

struct Player: Codable{
    var number: Int
    var playerName: String
    var position: String
    var playerImageName: String
    var playerImage :Image {
        Image(playerImageName)
    } 
}
