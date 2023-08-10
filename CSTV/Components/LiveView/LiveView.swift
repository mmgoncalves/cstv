//
//  LiveView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct LiveView: View {
    var body: some View {
        HStack {
            Text("AGORA")
                .font(.appFont(8))
                .padding(5)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .background(.red)
        .cornerRadius(5)
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}
