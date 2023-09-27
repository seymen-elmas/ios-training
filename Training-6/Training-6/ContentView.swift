//
//  ContentView.swift
//  Training-6
//
//  Created by Seymen Nadir Elmas on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .clear
    
    var body: some View {
        
        VStack {
            
            ColorSelectorView(selectedColor: $selectedColor)
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
                
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
