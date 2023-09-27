//
//  ContentView.swift
//  Training1
//
//  Created by Seymen Nadir Elmas on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
           
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(width: 200,height: 350,alignment: .center)
                VStack{
                    Rectangle()
                        .fill(.red)
                        .frame(width: 100,height: 100,alignment: .center)
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 100,height: 100,alignment: .center)
                    Rectangle()
                        .fill(.green)
                        .frame(width: 100,height: 100,alignment: .center)
                    Text(" Trafik Lambası-1")
                        .foregroundColor(Color(.white))
                     }
                }
            .padding()
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 200,height: 350,alignment: .center)
                VStack{
                    Rectangle()
                        .fill(.red)
                        .frame(width: 100,height: 100,alignment: .center)
                    Rectangle()
                        .fill(.mint)
                        .frame(width: 100,height: 100,alignment: .center)
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 100,height: 100,alignment: .center)
                    Text(" Trafik Lambası-2")
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
