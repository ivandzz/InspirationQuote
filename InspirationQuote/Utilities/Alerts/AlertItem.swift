//
//  Alert.swift
//  InspirationQuote
//
//  Created by Іван Джулинський on 30.05.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("OK")))

    static let genericError      = AlertItem(title: Text("Server Error"),
                                             message: Text("Something went wrong. Please check your internet connection or try later."),
                                             dismissButton: .default(Text("OK")))
}
