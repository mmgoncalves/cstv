//
//  LoadingView.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.appBackground
            ProgressView()
                .tint(.white)
                .scaleEffect(x: 2, y: 2)
        }.ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
