//
//  QuoteViewModel.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import SwiftUI

final class QuoteViewModel: ObservableObject {
    
    @Published var quote: [Quote] = []
    @Published var alert: AlertItem?
    
    func getQuote(type: NetworkManager.QuoteType) {
        Task {
            do {
                quote = try await NetworkManager.shared.getQuote(type: type)
            } catch {
                if let error = error as? NetworkError {
                    switch error {
                    case .invalidURL:
                        alert = AlertContext.invalidURL
                    case .invalidData:
                        alert = AlertContext.invalidData
                    }
                }
            }
        }
    }
}
