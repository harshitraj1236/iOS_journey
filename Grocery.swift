//
//  Grocery.swift
//  trainning
//
//  Created by Harshit Raj on 26/12/25.
//
import SwiftUI

struct GroceryList: View {

    @State private var items: [String] = ["Milk", "Eggs", "Bread"]
    @State private var newItem: String = ""

    func addItem() {
        guard !newItem.isEmpty else { return }
        items.append(newItem)
        newItem = ""
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("Enter Item", text: $newItem)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)

                Button("Add") {
                    addItem()
                }
                .disabled(newItem.isEmpty)
            }

            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.insetGrouped)
        }
        .padding()
    }
}

#Preview {
    GroceryList()
}
