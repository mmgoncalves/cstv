//
//  CardView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct CardView: View {
    private var teamOne: Team {
        match.opponents[0].team
    }
    
    private var teamTwo: Team {
        match.opponents[1].team
    }
    
    @StateObject var match: Match
    
    var body: some View {
        VStack {
            GameView(teamOne: teamOne, teamTwo: teamTwo)
                .padding(.init(top: 15, leading: 40, bottom: 5, trailing: 40))
            
            Divider()
                .background(.white.opacity(0.2))
                .padding(.bottom, 10)
            HStack {
                LeagueView(
                    leagueImage: match.league.image,
                    leagueName: match.league.name,
                    serieName: match.serie.name ?? ""
                )
                .padding(.leading, 20)
                Spacer()
            }
        }
        .frame(width: 312, height: 176)
        .background(Color.cardBackground)
        .cornerRadius(16)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CardView(
                match: Match(
                    id: 1,
                    league: League(
                        image: "https://cdn.pandascore.co/images/league/image/4842/600px-cct_south_america_icon_allmode-png",
                        name: "League Name"
                    ),
                    status: .running,
                    opponents: [
                        .init(
                            team: Team(
                                id: 1, image: "",
                                name: "Team One",
                                players: nil
                            )
                        ),
                        .init(
                            team: Team(
                                id: 2,
                                image: "https://cdn.pandascore.co/images/team/image/127929/turow_logo_2.png",
                                name: "Team Two",
                                players: nil
                            )
                        )
                    ],
                    serie: Serie(name: "Serie Name")
                )
            )
        }
    }
}
