//
//  QuoteView.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import SwiftUI

struct QuoteView: View {
    
    let quote: [Quote]
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.cyan)
                .shadow(radius: 5)
            
            VStack {
                Text(quote.first?.q ?? "Loading...")
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.01)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .italic()
                    .padding()
                    .shadow(radius: 10)
                
                Text(quote.first?.a ?? "Loading...")
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.01)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .italic()
                    .padding()
                    .shadow(radius: 10)
            }
            
        }

    }
}

#Preview {
    QuoteView(quote: MockData().sample)
}
