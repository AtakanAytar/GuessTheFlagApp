//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Atakan Aytar on 28.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var scoreCount = 0
    @State private var countries = ["estonia","france","germany","ireland","italy","nigeria","poland","russia","spain","uk","us","monaco"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of").foregroundColor(.white).font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer].uppercased()).foregroundColor(.white).foregroundColor(.white).font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3){
                    number in
                    Button{
                        flagTapped(number)
                    }label: {
                        Image(countries[number]).renderingMode(.original).shadow(radius: 5)
                    }
                    
                }
            }
            
        }.alert(scoreTitle,isPresented: $showingScore){
            Button("Resume",action:askQuestion)
        }message: {
            Text("Your Score is \(scoreCount)")
        }
        
            
        
    }
    func flagTapped (_ number:Int){
        if(number == correctAnswer){
            
            scoreTitle = "Correct"
            scoreCount  = scoreCount + 1
        }
        else{
            scoreTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    func askQuestion (){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
