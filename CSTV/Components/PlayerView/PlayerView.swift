//
//  PlayerView.swift
//  CSTV
//
//  Created by Mateus Marques on 11/08/23.
//

import SwiftUI

struct PlayerView: View {
    let player: Player
    let imagePosition: HorizontalAlignment
    private var isImageLeading: Bool {
        imagePosition == .leading
    }
    private var textAlignment: HorizontalAlignment {
        isImageLeading ? .leading : .trailing
    }
    
    private func textStack() -> some View {
        VStack(alignment: textAlignment, spacing: 4) {
            Text(player.name)
                .font(.appFont(14))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("\(player.firstName ?? "") \(player.lastName ?? "")")
                .font(.appFont(12))
                .foregroundColor(.subtitleColor)
        }
    }
    
    private func imageStack() -> some View {
        HStack {
            if let playerImage = player.image, !playerImage.isEmpty {
                AsyncImage(url: URL(string: playerImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .tint(.white)
                }
            } else {
                Rectangle()
                    .foregroundColor(Color.clear)
            }
        }
        .foregroundColor(.white)
        .frame(width: 48, height: 48)
        .cornerRadius(8)
        .offset(y:-8)
        .padding(isImageLeading ? .leading : .trailing,6)
    }
    
    var body: some View {
        ZStack {
            Color.cardBackground
                .frame(height: 54)
                .customCornerRadius(
                    12,
                    corners: isImageLeading ? .topLeft : .topRight
                )
                .customCornerRadius(
                    12,
                    corners: isImageLeading ? .bottomLeft : .bottomRight
                )
            HStack {
                if isImageLeading {
                    imageStack()
                    textStack()
                    Spacer()
                } else {
                    Spacer()
                    textStack()
                    imageStack()
                }
            }
            .padding(.leading, 4)
            .padding(.trailing, 4)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(
            player: .init(
                id: 1,
                firstName: "First",
                lastName: "Last",
                image: "https://cdn.pandascore.co/images/player/image/20573/nbl.png",
//                image: nil,
                name: "Player Name"
            ),
            imagePosition: .trailing
        )
    }
}
