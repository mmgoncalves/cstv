//
//  MatchTimeView.swift
//  CSTV
//
//  Created by Mateus Marques on 10/08/23.
//

import SwiftUI

struct MatchTimeView: View {
    var matchTime: String
    
    var body: some View {
        HStack {
            Text(matchTime)
                .font(.appFont(8))
                .padding(5)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .background(Color.matchTimeBackground.opacity(0.2))
        .customCornerRadius(16, corners: .bottomLeft)
    }
}

struct MatchTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.cardBackground
                .ignoresSafeArea()
            MatchTimeView(matchTime: "Hoje, 21:00")
        }
    }
}
