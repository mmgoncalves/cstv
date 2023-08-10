//
//  MatchListViewModel.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

protocol MatchListViewModelProtocol: ObservableObject {
    func loadMatches() async
    func reloadList() async
}

final class MatchListViewModel: MatchListViewModelProtocol {
    @Published private(set) var matchModel = MatchModel()
    @Published private (set) var isLoading = false
    
    private var currentPage = 0
    private let matchService: MatchServiceProtocol
    private let initialDate: Date
    
    init(
        matchService: MatchServiceProtocol = MatchService(),
        initialDate: Date = .now
    ) {
        self.matchService = matchService
        self.initialDate = initialDate
    }
    
    func loadMatches() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        currentPage += 1
        let dateRange = calculateDateRange()
        let result = await matchService.fetchMatches(
            page: currentPage,
            beginAt: dateRange.beginAt,
            endAt: dateRange.endAt
        )
     
        switch result {
        case .success(let matches):
            matchModel.append(matches)
        case .failure(let networkError):
            break
        }
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    func reloadList() async {
        currentPage = 0
        matchModel.reload()
        await loadMatches()
    }
    
    private func calculateDateRange() -> (beginAt: String, endAt: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let beginAt = dateFormatter.string(from: initialDate)
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = -1

        if let previousYearDate = calendar.date(byAdding: dateComponents, to: initialDate) {
            let endAt = dateFormatter.string(from: previousYearDate)
            return (beginAt, endAt)
        } else {
            return (beginAt, beginAt)
        }
    }
}
