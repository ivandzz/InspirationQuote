//
//  NetworkManager.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://zenquotes.io/api/"
    private let dailyURL = baseURL + "today"
    private let randomURL = baseURL + "random"
    
    private init() {}
    
    func getQuote(type: QuoteType) async throws -> [Quote] {
        let url: URL
        
        switch type {
        case .daily:
            guard let dailyURL = URL(string: dailyURL) else {
                throw NetworkError.invalidURL
            }
            url = dailyURL
        case .random:
            guard let randomURL = URL(string: randomURL) else {
                throw NetworkError.invalidURL
            }
            url = randomURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Quote].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    enum QuoteType {
        case daily
        case random
    }
}

// Перевірте, що оголошені NetworkError та Quote для правильного функціонування коду.
