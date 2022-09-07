//
//  ContentView.swift
//  WeSplit-HWS-1
//
//  Created by Kevin Mattocks on 9/5/22.
//

import SwiftUI

struct ContentView: View {
    
    //@State property wrapper watches for changes and when something happens it automatically reload the UI to reflect the changes
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    //Creating a constant array of predetermine tip percentage to allow individuals select a certain tip percetange
    
    let tipPercentages = [0, 10, 15, 18, 20, 25, 30]
    
    
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: - Check Amount
                Section {
                    //Pass in double as a value instead of text parameter. Also, ask the system to see what the user currency is using
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    //keyboard modifier allows the user to type in numbers with a decimal rather than the initial default keyboard
                }
                
                
                
                
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Creating a form or any view, it can only fit 10 views and not 11. If using more than 10. Group them.

//navigationTitle modifier should be placed within the NavigationView

//$ indicates two way binding of read and write
