//
//  ContentView.swift
//  Rock-Paper-Scissors
//
//  Created by Zakir Ufuk Sahiner on 01.02.24.
//
// 100 days of SwiftUI Milestone 1-3 Rock Paper Scissors with additional functions

import SwiftUI

struct ContentView: View {
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var roundCount = 0
    
    @State private var playerChoice = 0
    @State private var correctChoice = 0
    
    @State private var didChoose = false
    @State private var displayAlert = false
    
    @State private var cheatsEnabled = false
    
    var options = ["Rock", "Paper", "Scissors"]
    var correctOption = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            background
            VStack {
                title
                    .padding()
                ZStack {
                    Circle()
                        .frame(width: 150, height: 150, alignment: .center)
                        .foregroundStyle(.regularMaterial)
                    
                        .shadow(radius: 8)
                    switch options[correctOption] {
                    case "Rock":
                        appChoice(icon: "🪨")
                    case "Paper":
                        appChoice(icon: "📃")
                    case "Scissors":
                        appChoice(icon: "✂️")
                    default:
                        Text("")
                    }
                    
                }
                .padding(.top)
                Text("\(options[correctOption])")
                    .font(.title.bold())
                    .padding(.top)
                    .opacity(1)
                    .foregroundStyle(.white)
                HStack {
                    ForEach(0..<3) { num in
                        Button {
                            print("\(options[num]) Selected")
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 110, height: 100, alignment: .center)
                                        .foregroundStyle(.regularMaterial)
                                        .shadow(radius: 8)
                                    switch options[num] {
                                    case "Rock":
                                        Text("🪨")
                                            .font(.system(size: 40))
                                            .padding()
                                    case "Paper":
                                        Text("📃")
                                            .font(.system(size: 40))
                                            .padding()
                                    case "Scissors":
                                        Text("✂️")
                                            .font(.system(size: 40))
                                            .padding()
                                    default:
                                        Text("")
                                    }
                                }
                                
                                Text("\(options[num])")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                }
                .padding(40)
                Spacer()
                scoreboard
            }
        }
        
    }
}

struct normalText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .foregroundStyle(.white)
    }
}

struct appChoice: View {
    var icon: String
    
    var body: some View {
        Text(icon)
            .font(.system(size: 70))
            .padding()
    }
}

extension ContentView {
    private var background: some View {
        LinearGradient(
            colors: [
                Color(red: 0/255, green: 255/255, blue: 235/255),
                Color(red: 7/255, green: 58/255, blue: 187/255)],
            // red: 36/255, green: 98/255, blue: 255/255
            startPoint: .init(x: 0.11, y: 0.18),
            endPoint: .init(x: 0.89, y: 0.82))
        .ignoresSafeArea(edges: .all)
    }
    
    var title: some View {
        Text("Rock Paper Scissors")
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
    }
    
    var scoreboard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 270, height: 120, alignment: .topLeading)
                .foregroundStyle(.white)
                .opacity(0.2)
                .shadow(radius: 8)
            VStack(spacing: 0) {
                Text("Scoreboard")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                HStack (spacing: 40) {
                    VStack {
                        normalText(text: "App")
                        normalText(text: "2")
                    }
                    VStack {
                        normalText(text: "You")
                        normalText(text: "2")
                    }
                }
                Toggle(isOn: $cheatsEnabled, label: {
                    normalText(text: "Enable Cheats")
                })
                .tint(.gray)
                .frame(width: 240, height: 10, alignment: .leading)
                .padding()
                
            }
        }
    }
    
}

#Preview {
    ContentView()
}
