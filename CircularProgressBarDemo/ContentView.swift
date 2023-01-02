//
//  ContentView.swift
//  CircularProgressBarDemo
//
//  Created by Davide Troise with Swift 5.0
//  for the YouTube channel "Coding con Davide" https://bit.ly/3QJziJE
//

import SwiftUI

struct CircularProgressBar: View {
    let value: Double
    let total: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 30)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(value/total, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeOut, value: value)
        }
        .foregroundColor(.blue)
    }
}

struct ContentView: View {
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack {
            CircularProgressBar(value: progress, total: 100)
                .padding()
            Button {
                self.progress += 10
            } label: {
                Text("Increment Progress")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
