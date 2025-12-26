//
//  ContentView.swift
//  BBQuotes
//
//  Created by Arya Mirsepasi on 08.10.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Breaking Bad", systemImage: "tortoise") {
                QuoteView(show: "Breaking Bad")
            }
            Tab("Better call Saul", systemImage: "briefcase") {
                QuoteView(show: "Better call Saul")
            }
        }
        .preferredColorScheme(ColorScheme.dark)
    }
}

#Preview {
    ContentView()
}
