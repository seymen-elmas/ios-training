//
//  ContentView.swift
//  zikirmatik
//
//  Created by Seymen Nadir Elmas on 1.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State var say = 0
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 10.0){
                Text(" \(say)")
                    .font(.system(size: 36))
            }
            Button("Zikir Çek"){
                say = say+1
            }
            
            .navigationTitle("Zikir Matik")
            
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        say = 0                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
