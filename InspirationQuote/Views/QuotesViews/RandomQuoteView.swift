//
//  RandomQuoteView.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import SwiftUI

struct RandomQuoteView: View {
    
    @StateObject var viewModel = QuoteViewModel()

    var body: some View {
        VStack {
            Text("Random Quote")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
            
            QuoteView(quote: viewModel.quote)
            
            Spacer()
            
            Button(action: {
                viewModel.getQuote(type: .random)
            }, label: {
                Text("Update")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 280, height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            })
        }
        .task {
            viewModel.getQuote(type: .random)
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    RandomQuoteView()
}
