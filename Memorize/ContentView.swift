//
//  ContentView.swift
//  Memorize
//
//  Created by Rupali Rajput on 05/01/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟","🍀","👀","🚗","🍎","💝","💙","👌","❤","😍","😉","😓","😳","💪","💩","🍸","🔑","💖","🌟","🎉","🌺","🎶","👠","🏈","⚾","🏆","👽","💀","🐵","🐮","🐩","🐎","💣","👃","👂","🍓","💘","💜","👊","💋","😘","😜","😵","🙏","👋","🚽","💃","💎","🚀","🌙","🎁","⛄","🌊","⛵","🏀","🎱","💰","👶","👸","🐰","🐷","🐍","🐫","🔫","👄","🚲","🍉","💛","💚"]
    
    @State var emojiCount = 25
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(cardContent: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            Spacer()
            HStack{
                addBtn
                Spacer()
                minusBtn
            }
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var addBtn: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var minusBtn: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var cardContent: String
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 25)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                
                Text(cardContent).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.red)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
