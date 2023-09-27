//
//  ContentView.swift
//  Training-3
//
//  Created by Seymen Nadir Elmas on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    let cities = ["istanbul","mersin","izmir"]
    var body: some View {
        List(cities, id: \.self){ city in
            HStack{
                Image(city.lowercased())
                    .resizable()
                    .frame(width: 100,height: 100)
                Text(city)
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
            Text("Detail")
        }
        
    }
}
