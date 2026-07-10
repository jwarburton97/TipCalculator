//
//  ContentView.swift
//  TipCalculator
//
//  Created by Warburton, Jonathan R. [US-US] on 7/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0

    var tipAmount: Double {
        let bill = Double(billAmount) ?? 0
        return bill * (tipPercentage / 100)
    }

    var totalAmount: Double {
        let bill = Double(billAmount) ?? 0
        return bill + tipAmount
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bill Amount")) {
                    TextField("Enter amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Tip Percentage")) {
                    Slider(value: $tipPercentage, in: 0...30, step: 1)
                    Text("\(Int(tipPercentage))%")
                        .font(.headline)
                }

                Section(header: Text("Results")) {
                    HStack {
                        Text("Tip Amount:")
                        Spacer()
                        Text("$\(tipAmount, specifier: "%.2f")")
                            .fontWeight(.bold)
                    }

                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("$\(totalAmount, specifier: "%.2f")")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("Tip Calculator")
        }
    }
}

#Preview {
    ContentView()
}
