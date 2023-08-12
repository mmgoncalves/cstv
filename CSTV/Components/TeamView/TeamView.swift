//
//  TeamView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct TeamView: View {
    let teamImage: String?
    let teamName: String
    
    var body: some View {
        VStack {
            if let teamImage, !teamImage.isEmpty {
                AsyncImage(
                    url: URL(string: teamImage)
                ) { image in
                    image
                        .resizable()
                        .frame(width: 53, height: 60)
                } placeholder: {
                    ProgressView()
                        .padding(10)
                }
            } else {
                Image(systemName: "shield")
                    .resizable()
                    .frame(width: 53, height: 60)
                    .foregroundColor(.white)
            }
            
            Text(teamName)
                .font(.appFont(10))
                .foregroundColor(.white)
                .padding(8)
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.cardBackground
                .ignoresSafeArea()
            TeamView(
                teamImage: "https://cdn.pandascore.co/images/team/image/127929/turow_logo_2.png",
                teamName: "VELOX Argentina"
            )
        }
    }
}
