//
//  Tip_Splitter.swift
//  trainning
//
//  Created by Harshit Raj on 22/12/25.
//
import SwiftUI

struct TipSplitter: View {

    @State private var bill = ""
    @State private var tip = 10
    @State private var people = 2

    var billValue: Double {
        Double(bill) ?? 0
    }

    var totalWithTip: Double {
        billValue * (1 + Double(tip) / 100)
    }

    var splitAmount: Double {
        totalWithTip / Double(people)
    }

    var body: some View {
        VStack(spacing: 25) {

            Text("Tip Splitter")
                .font(.largeTitle.bold())
                .padding(.top)

            TextField("Enter bill amount", text: $bill)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)

            VStack(alignment: .leading) {
                Text("Tip Percentage")
                    .font(.headline)

                Picker("Tip", selection: $tip) {
                    ForEach([0,10,15,20], id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }

            VStack {
                Text("Total Bill")
                    .font(.headline)

                Text("₹\(totalWithTip, specifier: "%.2f")")
                    .font(.title2.bold())
                    .foregroundColor(.green)
            }

            VStack(alignment: .leading) {
                Text("Number of People")
                    .font(.headline)

                Picker("People", selection: $people) {
                    ForEach(2...10 , id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 120)
            }

            VStack {
                Text("Each Person Pays")
                    .font(.headline)

                Text("₹\(splitAmount, specifier: "%.2f")")
                    .font(.title.bold())
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TipSplitter()
}
