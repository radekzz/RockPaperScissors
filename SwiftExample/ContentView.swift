//
//  ContentView.swift
//  SwiftExample
//
//  Created by Radek Mezulanik on 02.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State var playerChoice = 1
    @State var cpuChoice = 2
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var result = ""
    
    func getImage(_ number: Int) -> String {
        if number == 1{
            return "rock"
        }
        else if number == 2 {
            return "paper"
        }
        else {
            return "scissors"
        }
    }
    
    func countResult(_ player: Int) -> Void {
        let cpuRand = Int.random(in: 1...3)
        let fight = player - cpuRand
        
        playerChoice = player
        cpuChoice = cpuRand
        
        if [-2,1].contains(fight){
            playerScore += 1
            result = "You win!"
        }
        else if [-1,2].contains(fight){
            cpuScore += 1
            result = "You lose"
        }
        else {
            result = "Draw"
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("rock paper scissors".uppercased())
            HStack(alignment: .bottom) {
                Spacer()
                Image(getImage(playerChoice))
                    .resizable()
                    .aspectRatio(contentMode:
                                        .fit)
                Spacer()
                Image(getImage(cpuChoice))
                    .resizable()
                    .aspectRatio(contentMode:
                                        .fit)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("Player")
                    Text(String(playerScore))
                }
                Spacer()
                Spacer()
                VStack {
                    Text("CPU")
                    Text(String(cpuScore))
                }
                Spacer()
            }
            Text(result).padding(.top, 20)
            HStack(alignment: .bottom) {
                Button(action:{
                    countResult(1)
                }, label:{
                    Image("rock").resizable().scaledToFit()
                }).padding(20)
                Button(action:{
                    countResult(2)
                    
                }, label:{
                    Image("paper").resizable().scaledToFit()
                }).padding(20)
                Button(action:{
                    countResult(3)
                }, label:{
                    Image("scissors").resizable().scaledToFit()
                }).padding(20)
            }.padding(.top, 20)
            Spacer()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
