//
//  ContentView.swift
//  ios13exp1
//
//  Created by Marc Enschede on 27/09/2019.
//  Copyright © 2019 Marc Enschede. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        Form {
            TextField("Name:", text: $name)
            Text("Hello \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
