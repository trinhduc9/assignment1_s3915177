//
//  TeamCard.swift
//  assignment1
//
//  Created by Duc Trinh Van Minh on 25/07/2023.
//

import SwiftUI

struct TeamCard: View {
    var team: Team
    var body: some View {
        HStack {
            team.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(team.teamName)
        }
    }
}

struct TeamCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamCard(team: teams[0])
    }
}
