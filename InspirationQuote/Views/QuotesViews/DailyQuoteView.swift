//
//  DailyQuote.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import SwiftUI

struct DailyQuoteView: View {
    
    @StateObject var viewModel = QuoteViewModel()

    var body: some View {
        VStack {
            Text("Daily Quote")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
            
            QuoteView(quote: viewModel.quote)
            
            Spacer()
        }
        .padding(.bottom, 70)
        .task {
            viewModel.getQuote(type: .daily)
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    DailyQuoteView()
}
