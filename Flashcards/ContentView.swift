//
//  ContentView.swift
//  Flashcards
//
//  Created by Alec DeG on 22/11/2026. To have an understanding of Swift.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //Query stays in sync with data. Always updated.
    @Query(sort: \Flashcard.createdAt) private var cards: [Flashcard]
     
    @State private var isShowingSheet = false
    
    @Environment(\.modelContext) private var modelContext
    
    
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
            
            List{
                ForEach(cards) { card in
                    CardRow(card: card)
                }
                .onDelete(perform: deleteCard)
            }
            Button("Add Card", systemImage: "plus") {
                isShowingSheet = true
            }
        }
        .padding()
        // The $ sign is used here because it lets someone else change it. So without the $ sign if you make an edit to it (add a new card) it wouldn't change the actual page. Now its gone anyways.
        
        .sheet(isPresented: $isShowingSheet) {
            AddCardView()
        }
    }
    
    private func deleteCard(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(cards[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Flashcard.self, inMemory: true)
}
