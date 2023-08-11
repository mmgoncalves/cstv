//
//  GameView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct GameView: View {
    var teamOne: Team
    var teamTwo: Team
    
    var body: some View {
        HStack {
            TeamView(teamImage: teamOne.image, teamName: teamOne.name)
            Spacer()
            Text("VS")
                .font(.appFont(12))
                .foregroundColor(.white.opacity(0.5))
                .padding()
            Spacer()
            TeamView(teamImage: teamTwo.image, teamName: teamTwo.name)
            
        }
        .background(Color.cardBackground)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameView(
                teamOne: Team(
                    id: 1, image: "",
                    name: "Team One",
                    players: nil
                ),
                teamTwo: Team(
                    id: 2,
                    image: "https://cdn.pandascore.co/images/team/image/127929/turow_logo_2.png",
                    name: "Team Two",
                    players: nil
                )
            )
        }
    }
}
