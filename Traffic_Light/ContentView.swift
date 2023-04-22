//
//  ContentView.swift
//  Traffic_Light
//
//  Created by Ярослав Любиченко on 20.4.2023.
//

import SwiftUI

struct ContentView: View {
    
    enum TrafficLights {
        case red, yellow, green
    }
    
    @State var currentLight: TrafficLights = .red
    @State var startButton = "START"
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.black).ignoresSafeArea()
            
            VStack() {
                ZStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 180, height: 480)
                        .cornerRadius(8)
                    
                    VStack {
                        Circle()
                            .fill(currentLight == .red ?
                                .red.opacity(1) : .red.opacity(0.3))
                            .frame(width: 130, height: 130)
                            .overlay {
                                Circle().stroke(.white, lineWidth: 5)
                            }
                        Circle()
                            .fill(currentLight == .yellow ?
                                .yellow.opacity(1) : .yellow.opacity(0.3))
                            .frame(width: 130, height: 130)
                            .overlay {
                                Circle().stroke(.white, lineWidth: 5)
                            }
                        Circle()
                            .fill(currentLight == .green ?
                                .green.opacity(1) : .green.opacity(0.3))
                            .frame(width: 130, height: 130)
                            .overlay {
                                Circle().stroke(.white, lineWidth: 5)
                            }
                    }
                }// end zstack
                
                Spacer()
                
                Button(action: {
                    if startButton == "START" {
                        startButton = "NEXT" }
                    
                    switch self.currentLight {
                    case .red:
                        self.currentLight = .yellow
                    case .yellow:
                        self.currentLight = .green
                    case .green:
                        self.currentLight = .red
                    }
                }) {
                    Text(startButton)
                        .font(.title2)
                        .frame(width: 140, height: 30)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(16)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.white, lineWidth: 5)
                        }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
