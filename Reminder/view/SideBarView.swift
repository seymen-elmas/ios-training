//
//  SideBarView.swift
//  Reminder
//
//  Created by Seymen Nadir Elmas on 28.09.2023.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("All items count 10")
            List(1...5, id:\.self){
                index in
                Text("List \(index)")
            }
            Button("Add List"){
                
            }
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
