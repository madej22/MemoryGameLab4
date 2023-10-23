//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let blueEmojiIcons: Array = ["🤣", "🙂", "🥹", "🤗", "🫠", "🥰", "😇", "😝", "🤓", "😎", "🤣", "🙂", "🥹", "🤗", "🫠", "🥰", "😇", "😝", "🤓", "😎"]
    let redEmojiIcons: Array = ["⚽️", "🏀", "🥎", "🎱", "🪃", "🥊", "🏹", "🥋", "⛸️", "⚽️", "🏀", "🥎", "🎱", "🪃", "🥊", "🏹", "🥋", "⛸️"]
    let greenEmojiIcons: Array = ["🌵", "🌲", "🌳", "🍄", "🌹", "☘️", "🌻", "🍁", "🌵", "🌲", "🌳", "🍄", "🌹", "☘️", "🌻", "🍁"]
    @State var emojiIcons: Array = ["🤣", "🙂", "🥹", "🤗", "🫠", "🥰", "😇", "😝", "🤓", "😎", "🤣", "🙂", "🥹", "🤗", "🫠", "🥰", "😇", "😝", "🤓", "😎"]
    @State var selectedColor: Color = .blue
    
//    var numCardsAdjuster: some View {
//        HStack {
//            buttonMinus
//            Spacer()
//            buttonPlus
//        }.padding()
//    }
    
    func shuffleEmojiIcons(iconArray: Array<String>) {
        emojiIcons = iconArray.shuffled()
    }
    
    func changeColorSelection(chosenColor: Color) {
        selectedColor = chosenColor
    }
    
    var themeAdjuster: some View {
        HStack {
            ThemeButton(icon: "smiley.fill", label: "Motyw 1", onClick: {
                changeColorSelection(chosenColor: .blue)
                shuffleEmojiIcons(iconArray: blueEmojiIcons)
            }).foregroundColor(selectedColor)
            Spacer()
            ThemeButton(icon: "trophy.circle", label: "Motyw 2", onClick: {
                changeColorSelection(chosenColor: .red)
                shuffleEmojiIcons(iconArray: redEmojiIcons)
            }).foregroundColor(selectedColor)
            Spacer()
            ThemeButton(icon: "tree.circle", label: "Motyw 3", onClick: {
                changeColorSelection(chosenColor: .green)
                shuffleEmojiIcons(iconArray: greenEmojiIcons)
            }).foregroundColor(selectedColor)
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach (0..<emojiIcons.count, id: \.self) {index in
                CardView(content: emojiIcons[index]).aspectRatio(2/3, contentMode: .fit).foregroundColor(selectedColor)
            }
        }
    }
//
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        symbol == "+" ?
//            Button(symbol) {
//                if (numCards/2 < symbols.count/2) {
//                    numCards += 2
//                }
//            }.font(.largeTitle).disabled(numCards >= symbols.count).frame(width: 55, height: 45).border(.blue, width: 2).cornerRadius(4)
//            :
//            Button(symbol) {
//                if (numCards > 0) {
//                    numCards -= 2
//                }
//            }.font(.largeTitle).disabled(numCards == 0).frame(width: 55, height: 45).border(.blue, width: 2).cornerRadius(4)
//    }
    
//    var buttonPlus: some View {
//        adjustCardNumber(by: 2, symbol: "+")
//    }
//
//    var buttonMinus: some View {
//        adjustCardNumber(by: -2, symbol: "-")
//    }

    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
//            numCardsAdjuster
            themeAdjuster
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
