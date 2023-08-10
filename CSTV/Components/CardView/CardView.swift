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
    
    var match: Match
    
    var body: some View {
        VStack {
            HStack {
                GameView(teamOne: teamOne, teamTwo: teamTwo)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                VStack {
                    if match.status == .running {
                        LiveView()
                    } else if let matchTime = match.matchTime {
                        MatchTimeView(matchTime: matchTime)
                    }
                    Spacer()
                }
            }
            VStack {
                Divider()
                    .background(.white.opacity(0.2))
                HStack {
                    LeagueView(
                        leagueImage: match.league.image,
                        leagueName: match.league.name,
                        serieName: match.serie.name ?? ""
                    )
                    .padding(.leading, 20)
                    .padding(.bottom, 5)
                    Spacer()
                }
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
                    beginAt: "2023-08-10T18:28:00Z",
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
