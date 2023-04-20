//
//  ContentView.swift
//  Traffic_Light
//
//  Created by Ярослав Любиченко on 20.4.2023.
//

import SwiftUI

struct ContentView: View {
    
    enum TrafficLightColor {
        case red
        case yellow
        case green
    }
    
    @State var currentColor: TrafficLightColor = .red
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue).ignoresSafeArea()
            VStack {
                Spacer()
                
                Circle()
                    //.stroke(lineWidth: 5)
                    .fill(currentColor == .red ?
                        .red.opacity(1) : .red.opacity(0.1))
                    .frame(width: 130, height: 130)
                Circle()
                    //.stroke(Color.yellow ,lineWidth: 2)
                    .fill(currentColor == .yellow ?
                        .yellow.opacity(1) : .yellow.opacity(0.1))
                    .frame(width: 130, height: 130)
                Circle()
                    .fill(currentColor == .green ?
                        .green.opacity(1) : .green.opacity(0.1))
                    .frame(width: 130, height: 130)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    switch self.currentColor {
                    case .red:
                        self.currentColor = .yellow
                    case .yellow:
                        self.currentColor = .green
                    case .green:
                        self.currentColor = .red
                    }
                }, label: {
                    Text("Switch Lights")
                        .padding()
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(16)
                })
            }// end vstack
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
