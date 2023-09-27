//
//  ContentView.swift
//  Training-5
//
//  Created by Seymen Nadir Elmas on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    var body: some View {
        VStack {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.system(size: 62))
                .foregroundColor(.yellow)
            Toggle(isOn: $isOn){
                EmptyView()
            }.frame(width:20,height:20,alignment:.center)
            
        } .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
