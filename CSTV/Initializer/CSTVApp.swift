//
//  CSTVApp.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import SwiftUI
import UIKit

@main
struct CSTVApp: App {
    var body: some Scene {
        WindowGroup {
            MatchListView()
                .onAppear(perform: {
                    setupNavigationBar()
            })
            .environmentObject(MatchListViewModel())
        }
    }
    
    func setupNavigationBar() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor(named: "appBackground")
    }
}
