/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 04/08/2023
 Last modified:
 Acknowledgement: Acknowledge the resources that you use here.
*/


import SwiftUI

struct TitleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "GSWlogo")
    }
}
