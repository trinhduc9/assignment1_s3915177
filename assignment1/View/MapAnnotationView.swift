/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 29/07/2023
 Last modified: 02/08/2023
 Acknowledgement: 
 - https://www.youtube.com/watch?v=OaIn7HBlCSk
 - https://www.youtube.com/watch?v=javFZbCYGfc
 - https://developer.apple.com/documentation/swiftui
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-open-web-links-in-safari
 - https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
*/

import SwiftUI


//Customize map pin
struct MapAnnotationView: View{

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "sportscourt.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.black)
                .cornerRadius(36)

            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 15, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -2)
                .padding(.bottom, 40)
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
