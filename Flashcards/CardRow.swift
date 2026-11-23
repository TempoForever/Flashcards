import SwiftUI

struct CardRow: View {
    let card: Flashcard
    
    // By default should be false as front is showing
    @State private var isShowingBack = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(card.front)
                    .font(.headline)
                
                if isShowingBack {
                    Text("Answer: \(card.back)")
                        .foregroundStyle(.indigo)
                } else {
                    // if let gives creates a real string. Which is what hint Text needs. It needs a String and not a String?
                    if let hint = card.hint {
                        Text("Hint: \(hint)")
                            .font(.subheadline)
                            .italic()
                            .foregroundStyle(.secondary)
                    }
                    
                }
            }
            Spacer()
            // != is used here as it makes a true/false. This is fine for the lightbulb, beacuse the icon never shows the hint text.
            if card.hint != nil {
                Image(systemName: "lightbulb.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4)
        
        // Responsible for interactions (clicking) on the flashcards
        .onTapGesture {
            withAnimation{
                isShowingBack.toggle() // toggle flips between true and false
            }
        }
        
    }
}
#Preview {
    CardRow(card: Flashcard.examples[0])
}
