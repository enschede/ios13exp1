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
                self.showingSheet.toggle()
            }) {
                Text("Show actionsheet")
            }
            .sheet(isPresented: $showingSheet) {
                DetailView(firstname: self.$person.firstname, lastname: self.$person.lastname)
            }
        }
    }
}

struct DetailView: View {
    @Binding var firstname: String
    @Binding var lastname: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Form {
            TextField("Firstname", text: $firstname)
            TextField("Lastname", text: $lastname)

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
