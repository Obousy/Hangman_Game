//
//  ContentView.swift
//  GuessApplication
//
//  Created by Mustafa Obousy on 08/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var guessed = " "
    @State var levelStatus = 0
    @State var selectedWord = ""
    @State var ourWords = ["apple", "carrot", "dinosaur", "map"]
    
    @State var men = ["man 1", "man 2", "man 3", "man 4", "man 5", "man 6", "man 7", "man 8", "man 9"]
    @State var living = 8
    
    var body: some View {
        ZStack {
            Image(men[living]).resizable().scaledToFit()
            
           
        }
        VStack {
            Text("The Game").bold().font(.largeTitle)
            Spacer()
            if levelStatus == 0 {
                Image(systemName: "questionmark.diamond").font(.largeTitle)
                Text("Guess the word")
            }
            if levelStatus == 1 {
                Image(systemName: "checkmark").font(.largeTitle)
                Text("Winner")
                Button(action: {
                    selectedWord = ourWords.randomElement()!
                    levelStatus = 0
                    guessed = ""
                }) {
                    Text("Play Again")
                }
            }
            if levelStatus == 2 {
                Image(systemName: "xmark").font(.largeTitle)
                Text("Loser")
              
            }
            
            TextField("Guess the word", text: $guessed)
            Spacer()
            Button(action: {submitAnswer() } ) {
                Text("Submit")
            }
        }.padding().onAppear(perform: {
            selectedWord = ourWords.randomElement()!
        })
    }

                             func submitAnswer() {
                                 if guessed.lowercased() == selectedWord{
                                     levelStatus = 1
                                    
                                 }
                                 else {
                                     levelStatus = 2
                                     guessed = ""
                                     living -= 1
                                 }
                             }
                            
                             
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
        }
                             
                             
