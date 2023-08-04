/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 31/07/2023
 Last modified:
 Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct TeamLogoView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.white),lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct TeamLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamLogoView(image: Image("GSWlogo"))
    }
}
