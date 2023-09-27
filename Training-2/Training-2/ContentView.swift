//
//  ContentView.swift
//  Training-2
//
//  Created by Seymen Nadir Elmas on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    let names = ["Alex", "John", "Mary", "Steven"]
    
    var body: some View {
        List(names, id: \.self) { name in
            Text(name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
            Text("Detail")
        }
    }
}

