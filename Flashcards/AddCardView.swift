//
//  AddCardView.swift
//  Flashcards
//
//  Created by Alec De Grebber on 23/11/2026.
//

//Encountered problem that sometimes user is unable to type into the TextFields. Works in simulator

import SwiftUI
import SwiftData

struct AddCardView: View {
    // @Binding borrows data and lets this view change the data. It doesn't own the data.

    //When user clicks "Cancel" button, this closes the view.
    @Environment(\.dismiss) private var dismiss

    // To be able to save new cards to the database
    @Environment(\.modelContext) private var modelContext

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
                            hint: hint.isEmpty ? nil : hint  // If the cards hint is empty use nil else use what was typed
                        )
                        modelContext.insert(newCard)
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
    ContentView()
        .modelContainer(for: Flashcard.self, inMemory: true)
}
