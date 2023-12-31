//
//  MatchListView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct MatchListView: View {
    @EnvironmentObject var viewModel: MatchListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading || viewModel.matches.isEmpty {
                    LoadingView()
                        .navigationTitle("")
                } else {
                    VStack {
                        List(viewModel.matches) { match in
                            ZStack(alignment: .leading) {
                                 NavigationLink(
                                    destination: MatchDetailView()
                                        .toolbarRole(.editor)
                                        .environmentObject(
                                            MatchDetailViewModel(
                                                match: match
                                            )
                                        )
                                 ) {}.opacity(0.0)
                                
                                CardView(match: match)
                                    .onAppear {
                                        Task {
                                            await viewModel.loadMoreMatchesIfNeeded(match)
                                        }
                                    }
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.appBackground)
                        }
                        .scrollContentBackground(.hidden)
                        .navigationTitle(Text("Partidas"))
                        .refreshable {
                            await viewModel.reloadList()
                        }
                        if viewModel.isReloading {
                            ProgressView()
                                .tint(.white)
                        }
                    }
                }
            }
            .background(Color.appBackground)
        }
        .task({
            await viewModel.loadMatches()
        })
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView()
            .environmentObject(MatchListViewModel())
    }
}

