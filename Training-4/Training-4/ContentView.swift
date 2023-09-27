//
//  ContentView.swift
//  Training-4
//
//  Created by Seymen Nadir Elmas
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            
            Text("\(counter)")
                .font(.largeTitle)
            Button("increment"){
                counter += 1
                if counter == 34{
                    counter = 0
                }
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
