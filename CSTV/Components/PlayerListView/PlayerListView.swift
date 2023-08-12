//
//  PlayerListView.swift
//  CSTV
//
//  Created by Mateus Marques on 11/08/23.
//

import SwiftUI

struct PlayerListView: View {
    let players: [Player]
    let imagePosition: HorizontalAlignment
    private var isImageLeading: Bool {
        imagePosition == .leading
    }
    var body: some View {
        VStackLayout {
            ForEach(players) { player in
                PlayerView(
                    player: player,
                    imagePosition: imagePosition
                )
                .frame( height: 64)
            }
            Spacer()
        }
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            PlayerListView(
                players: [
                    .init(
                        id: 1,
                        firstName: "First",
                        lastName: "Last 1",
                        image: "https://cdn.pandascore.co/images/player/image/20573/nbl.png",

                        name: "Player One"
                    ),
                    .init(
                        id: 2,
                        firstName: "First",
                        lastName: "Last 2",
                        image: "",
                        name: "Player Two"
                    ),
                    .init(
                        id: 3,
                        firstName: "First",
                        lastName: "Last 2",
                        image: "https://cdn.pandascore.co/images/player/image/20573/nbl.png",
                        name: "Player Three"
                    )
                ],
                imagePosition: .trailing
            )
        }
    }
}
