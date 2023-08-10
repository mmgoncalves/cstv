//
//  MatchModel.swift
//  CSTV
//
//  Created by Mateus Marques on 08/08/23.
//

import SwiftUI

final class MatchModel: ObservableObject {
    @Published private(set) var matches: [Match] = []
    
    func reload() {
        matches.removeAll()
    }
    
    func append(_ newMatches: [Match]) {
        matches.append(contentsOf: newMatches)
    }
}
