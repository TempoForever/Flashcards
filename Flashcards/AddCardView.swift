//
//  AddCardView.swift
//  Flashcards
//
//  Created by Alec De Grebber on 23/11/2026.
//

//Encountered problem that sometimes user is unable to type into the TextFields. After a while it works again.

import SwiftUI

struct AddCardView: View {
    // This is @Binding. Binding borrows data and lets this view change the data. It doesn't own the data.
    @Binding var cards: [Flashcard] //Type
    
    //When user clicks "Cancel" button, this closes the view.
    @Environment(\.dismiss) private var dismiss
    
    // Will be entered by user
    @State private var front = ""
    @State private var back = ""
    @State private var hint = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Card") {
                    TextField("Question", text: $front)
                    TextField("Answer", text: $back)
                }
                
                Section("Optional Hint") {
                    TextField("Hint", text: $hint)
                }
            }
            .navigationTitle("New Card")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newCard = Flashcard(
                            front: front,
                            back: back,
                            hint: hint.isEmpty ? nil : hint // If the cards hint is empty use nil else use what was typed
                        )
                        cards.append(newCard)
                        dismiss()
                    }
                    // If the two necessary fields front and back (question and answer) are left empty disable the "Save" button. Front and back filled.
                    .disabled(front.isEmpty || back.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddCardView(cards: .constant(Flashcard.examples)) // .constant = binding with an immutable value.
}
