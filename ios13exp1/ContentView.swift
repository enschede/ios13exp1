//
//  ContentView.swift
//  ios13exp1
//
//  Created by Marc Enschede on 27/09/2019.
//  Copyright © 2019 Marc Enschede. All rights reserved.
//

import SwiftUI

class Person: ObservableObject {
    @Published var firstname: String = ""
    @Published var lastname: String = ""
}

struct ContentView: View {
    
    @ObservedObject private var person = Person()
    
    var body: some View {
        Form {
            TextField("Firstname", text: $person.firstname)
            TextField("Lastname", text: $person.lastname)
            
//            Spacer()
            
            Text("Hello \(person.firstname) \(person.lastname)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
