import SwiftUI

struct CardRow: View {
    let card: Flashcard
    
    // By default should be false as front is showing
    @State private var isShowingBack = false
    
    var body: some View {
        ZStack{
            front
            
                .rotation3DEffect(.degrees(isShowingBack ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            // So you dont see the other face
                .opacity(isShowingBack ? 0 : 1)
            
            back
                .rotation3DEffect(.degrees(isShowingBack ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                .opacity(isShowingBack ? 1 : 0)
            
        }
        .padding(.vertical, 4)
        
        //Responisble for switching faces when clicked on empty space
        .contentShape(Rectangle())
        // Responsible for interactions (clicking) on the flashcards
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.4)) {
                isShowingBack.toggle() // toggle flips between true and false
            }
        }
    }
    
    private var front: some View {
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
    }
    
    
    
    private var back: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(card.front)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("Answer: \(card.back)")
                    .font(.headline)
                    .foregroundStyle(.indigo)
            }
            Spacer()
        }
        
    }
    
}

#Preview {
    CardRow(card: Flashcard.examples[0])
}
