//
//  ContentView.swift
//  WeSplit-HWS-1
//
//  Created by Kevin Mattocks on 9/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Text("Hello, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Creating a form or any view, it can only fit 10 views and not 11. If using more than 10. Group them.
