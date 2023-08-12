//
//  MatchListViewModel.swift
//  CSTV
//
//  Created by Mateus Marques on 09/08/23.
//

import Foundation

final class MatchListViewModel: ObservableObject {
    @Published private(set) var matches: [Match] = []
    @Published private (set) var isLoading = false
    @Published private (set) var isReloading = false
    
    private(set) var refreshItems = false
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
        await MainActor.run { [weak self] in
            self?.isLoading = true
        }
        
        currentPage = 1
        await fetchMatches()
        
        await MainActor.run { [weak self] in
            self?.isLoading = false
        }
    }
    
    func reloadList() async {
        refreshItems = true
        await loadMatches()
    }
    
    func loadMoreMatchesIfNeeded(_ match: Match) async {
        let total = matches.count
        let lastMatch = matches[total - 1]
        if match.id == lastMatch.id {
            await MainActor.run { [weak self] in
                self?.isReloading = true
            }
            
            currentPage += 1
            await fetchMatches()
            
            await MainActor.run { [weak self] in
                self?.isReloading = false
            }
        }
    }
    
    private func fetchMatches() async {
        let dateRange = calculateDateRange()
        let result = await matchService.fetchMatches(
            page: currentPage,
            beginAt: dateRange.beginAt,
            endAt: dateRange.endAt
        )
        
        switch result {
        case .success(let matches):
            if refreshItems {
                refreshItems = false
                await MainActor.run { [weak self] in
                    self?.matches = []
                }
            }
            await MainActor.run { [weak self] in
                self?.matches.append(contentsOf: matches)
            }
        case .failure(let networkError):
            print("NetworkError =>", networkError)
        }
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
