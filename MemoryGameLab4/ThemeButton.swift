//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 23/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    let icon: String
    let label: String
    let onClick: () -> ()
    var body: some View {
        VStack {
            Image(systemName: icon).font(.largeTitle)
            Text(label)
        }
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    ThemeButton(icon: "🙂", label: "Motyw 1", onClick: {})
}
