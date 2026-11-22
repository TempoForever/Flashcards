import SwiftUI

struct CardRow: View {
    let card: Flashcard
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(card.front)
                    .font(.headline)
                // if let gives creates a real string. Which is what hint Text needs. It needs a String and not a String?
                if let hint = card.hint {
                    Text("Hint: \(hint)")
                        .font(.subheadline)
                        .italic()
                        .foregroundStyle(.secondary)
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
    }
    
}
#Preview {
    CardRow(card: Flashcard.examples[0])
}



