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
    @State private var showingSheet = false {
        didSet {
            print("showingsheet = \(showingSheet)")
        }
    }
    
    var body: some View {
        Form {
            TextField("Firstname", text: $person.firstname)
            TextField("Lastname", text: $person.lastname)
            
            Text("Hello \(person.firstname) \(person.lastname)")
            
            Button(action: {
                self.showingSheet = true
            }) {
                Text("Show actionsheet")
            }
            .actionSheet(isPresented: $showingSheet) {
                ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
