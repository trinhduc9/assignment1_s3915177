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
            .shadow(color: Color(red: 0.4, green: 0.4, blue: 0.9, opacity: 0.9), radius: 10, x: 0, y: 10)
            
    }
}

struct TeamLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TeamLogoView(image: Image("Netslogo"))
    }
}
