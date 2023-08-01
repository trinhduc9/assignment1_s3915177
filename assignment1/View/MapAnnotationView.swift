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

struct MapAnnotationView: View{

    var body: some View {
        VStack(spaceing: 0) {
            Image(systemName: "stadium.fill")
                .resizeable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.black)
                .cornerRadius(36)

            Image(systemName: "triangle.file")
                .resizeable()
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}