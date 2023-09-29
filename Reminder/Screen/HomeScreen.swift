//
//  HomeScreen.swift
//  Reminder
//
//  Created by Seymen Nadir Elmas on 28.09.2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView{
            HStack{
                
                SideBarView()
                Text("My List Items")
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
