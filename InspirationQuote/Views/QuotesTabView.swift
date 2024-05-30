//
//  ContentView.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import SwiftUI

struct QuotesTabView: View {
    var body: some View {
        TabView {
            DailyQuoteView()
                .tabItem { Label("Daily Quote", systemImage: "calendar") }
            
            RandomQuoteView()
                .tabItem { Label("Random Quote", systemImage: "dice") }
        }
    }
}

#Preview {
    QuotesTabView()
}
