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
    
    private init() {}Q
    
    func getDailyQuote() async throws -> [Quote] {
        guard let url = URL(string: dailyURL) else {
            throw NetworkError.invalidURL
        }
       
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Quote].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    func getRandomQuote() async throws -> [Quote] {
        guard let url = URL(string: randomURL) else {
            throw NetworkError.invalidURL
        }
       
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Quote].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
