//
//  ContentView.swift
//  Flashcards
//
//  Created by Alec DeG on 22/11/2026. To have an understanding of Swift.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = Flashcard.examples
    
    @State private var isShowingSheet = false
    
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
            
            List(cards) { card in
                CardRow(card: card)
                
            }
            Button("Add Card", systemImage: "plus") {
                isShowingSheet = true
            }
        }
        .padding()
        // The $ sign is used here because it lets someone else change it. So without the $ sign if you make an edit to it (add a new card) it wouldn't change the actual page.
        .sheet(isPresented: $isShowingSheet) {
            AddCardView(cards: $cards)
        }
    }
}

#Preview {
    ContentView()
}
