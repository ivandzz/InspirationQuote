//
//  Quote.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import Foundation

struct Quote: Decodable, Hashable {
    let q: String 
    let a: String
}

final class MockData {
    
    let sample = [Quote(q: "I have no special talent. I am only passionately curious.", a: "Albert Einstein")]
}
