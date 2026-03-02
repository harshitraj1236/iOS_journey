//
//  todo.swift
//  trainning
//
//  Created by Harshit Raj on 26/12/25.
//
import SwiftUI
struct TodoItem: Identifiable {
    let id = UUID()
    let title : String
    var isCompleted : Bool
}
struct TodoHero: View {
    @State private var todos = [
            TodoItem(title: "Learn Swift", isCompleted: false),
            TodoItem(title: "Build an App", isCompleted: false),
            TodoItem(title: "Drink Water", isCompleted: true)
        ]
    var body:some View{
        List{
            ForEach($todos){ $todo in
                HStack{
                    Image(systemName:todo.isCompleted ? "checkmark.circle.fill":"circle")
                        .foregroundColor(todo.isCompleted ? .green : .gray)
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    todo.isCompleted.toggle()
                }
            }
        }
        .padding()
    }
}
#Preview {
    TodoHero()
}
