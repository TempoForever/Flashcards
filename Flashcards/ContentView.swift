//
//  ContentView.swift
//  Flashcards
//
//  Created by Alec DeG on 22/11/2026. To have an understanding of Swift.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "rectangle.stack.fill")
                .font(.system(size: 60))
                .foregroundStyle(.indigo)
            
            Text("Flashcards")
                .font(.largeTitle).bold()
            Text("Study Smarter")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            List(Flashcard.examples) { card in
                CardRow(card: card)
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
