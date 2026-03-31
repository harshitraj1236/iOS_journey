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
    
    @State private var newTodo:String = ""
    
    var body:some View{
        VStack(alignment: .center,spacing: 14){
            HStack(spacing: 20){
                TextField("Add New Task", text: $newTodo)
                    .border(Color.blue)
                    .textFieldStyle(.roundedBorder)
                    .font(Font.system(size: 20, weight: .semibold, design: .serif))
                
                Button("Add"){
                    let trimmedTitle = newTodo.trimmingCharacters(in: .whitespaces)
                    guard !trimmedTitle.isEmpty
                    else{
                        return
                    }
                    todos.append(TodoItem(title: trimmedTitle, isCompleted: false))
                    newTodo = ""
                }
            }
            .padding()
            
            List($todos){$todo in
                HStack{
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
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
    }
}
    #Preview {
        TodoHero()
    }
