//
//  LeagueView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct LeagueView: View {
    let leagueImage: String?
    let leagueName: String
    let serieName: String
    
    var body: some View {
        HStack {
            if let leagueImage, !leagueImage.isEmpty {
                AsyncImage(
                    url: URL(string: leagueImage)
                ) { image in
                    image
                        .resizable()
                        .frame(width: 16, height: 16)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "flag")
                    .resizable()
                    .cornerRadius(8)
                    .frame(width: 16, height: 16)
            }
            
            Text(leagueName)
                .font(.appFont(8))
                .foregroundColor(.white)
            Text(serieName)
                .font(.appFont(8))
                .foregroundColor(.white)
        }
    }
}

struct LeagueView_Previews: PreviewProvider {
    static var leagueImage: String? = "https://cdn.pandascore.co/images/league/image/4842/600px-cct_south_america_icon_allmode-png"
    
    static var previews: some View {
        ZStack {
            Color.cardBackground
                .ignoresSafeArea()
            LeagueView(
                leagueImage: leagueImage,
                leagueName: "League Name",
                serieName: "Serie Name"
            )
        }
    }
}
