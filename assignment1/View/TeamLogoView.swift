//
//  TeamLogoView.swift
//  assignment1
//
//  Created by Duc Trinh Van Minh on 31/07/2023.
//

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
