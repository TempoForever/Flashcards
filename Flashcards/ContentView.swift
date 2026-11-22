//
//  ContentView.swift
//  Flashcards
//
//  Created by Alec De Grebber on 22/11/2026. To have an understanding of Swift.
//

import SwiftUI

struct ContentView: View {
    let card = Flashcard.examples[0]
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
            Text(card.front)
            if let hint = card.hint {
                Text("Hint: \(hint)")
                    .font(.subheadline)
                    .italic()
                    .padding(5)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
