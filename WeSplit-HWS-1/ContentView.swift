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
    
    //Focus is it receiving user input or not. Similar to @State property
    @FocusState private var amountIsFocused: Bool
    
    
    //Creating a constant array of predetermine tip percentage to allow individuals select a certain tip percetange
    
    let tipPercentages = [0, 15, 18, 20, 30]
    
    //Computed property to calculate the bill
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
   
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: - Amount and Number of People
                Section {
                    //Pass in double as a value instead of text parameter. Also, ask the system to see what the user currency is using
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    //keyboard modifier allows the user to type in numbers with a decimal rather than the initial default keyboard
                    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                            //numberOfPeople is considered the third row, therefore displays 4
                        }
                    }
                }
                
                //MARK: - Selecting Tip Percentage
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                
                //MARK: - Check Amount
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
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


//Creating a form or any view, it can only fit 10 views and not 11. If using more than 10. Group them.

//navigationTitle modifier should be placed within the NavigationView

//$ indicates two way binding of read and write
