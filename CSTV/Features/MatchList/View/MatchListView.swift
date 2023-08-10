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
                if viewModel.isLoading {
                    LoadingView()
                        .navigationTitle("")
                } else {
                    List {
                        ForEach(viewModel.matchModel.matches) { match in
                            CardView(match: match)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.appBackground)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle(Text("Partidas"))
                }
            }
            .background(Color.appBackground)
        }.onAppear {
            Task {
                await viewModel.loadMatches()
            }
        }
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView()
            .environmentObject(MatchListViewModel())
    }
}

