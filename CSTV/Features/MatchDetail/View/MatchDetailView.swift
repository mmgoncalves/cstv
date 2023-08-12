//
//  MatchDetailView.swift
//  CSTV
//
//  Created by Mateus Marques on 11/08/23.
//

import SwiftUI

struct MatchDetailView: View {
    @EnvironmentObject var viewModel: MatchDetailViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                VStack {
                    if viewModel.isLoading {
                        LoadingView()
                    } else {
                        VStack {
                            HStack {
                                VStack {
                                    GameView(
                                        teamOne: viewModel.teamOne,
                                        teamTwo: viewModel.teamTwo
                                    )
                                    .frame(width: 230)
                                    .padding(.top, 20)
                                    if let matchTime = viewModel.matchTime {
                                        Text(matchTime)
                                            .font(.appFont(12))
                                            .foregroundColor(.white)
                                            .fontWeight(.heavy)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                    }
                                }
                                .navigationTitle(viewModel.title)
                                .navigationBarTitleDisplayMode(.inline)
                            }
                            ScrollView {
                                GeometryReader { geometry in
                                    HStack {
                                        PlayerListView(
                                            players: viewModel.playersTeamOne,
                                            imagePosition: .trailing
                                        )
                                        .frame(
                                            maxWidth: geometry.size.width / 2
                                        )
                                        PlayerListView(
                                            players: viewModel.playersTeamTwo,
                                            imagePosition: .leading
                                        )
                                        .frame(
                                            maxWidth: geometry.size.width / 2
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadTeams()
        }
    }
}

struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetailView()
            .environmentObject(
                MatchDetailViewModel(
                    match: .init(
                        id: 1,
                        beginAt: Date().ISO8601Format(),
                        league: .init(
                            image: "",
                            name: "League Name"),
                        status: .running,
                        opponents: [
                            .init(
                                team: .init(
                                    id: 133125,
                                    image: "",
                                    name: "Team 1 Name",
                                    players: [
                                        .init(
                                            id: 1,
                                            firstName: "First1",
                                            lastName: "Last1",
                                            image: "https://cdn.pandascore.co/images/player/image/20573/nbl.png",
                                            name: "Player 1 name"
                                        )
                                    ]
                                )
                            ),
                            .init(
                                team: .init(
                                    id: 132686,
                                    image: "",
                                    name: "Team 2 Name",
                                    players: [
                                        .init(
                                            id: 1,
                                            firstName: "First2",
                                            lastName: "Last2",
                                            image: "",
                                            name: "Player 2 name"
                                        )
                                    ]
                                )
                            )
                        ],
                        serie: .init(
                            name: "Serie name"
                        )
                    )
                )
            )
    }
}
