import SwiftUI
struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let desc: String
}
struct SimpleMenu: View {
    let items:[MenuItem] = [
        MenuItem(name: "Burger", price: "$1.99", desc: "Cheesy and Delicious"),
        MenuItem(name: "Pizza", price: "$3.88", desc: "Italy Special"),
        MenuItem(name: "Pasta", price: "$2.22", desc: "Creamy and Spicy")
    ]
    var body: some View {
        NavigationStack{
            List(items){item in
                NavigationLink{
                    MenuItemDetails(item:item)
                }label:{
                    VStack(alignment: .leading){
                        Text(item.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text(item.price)
                            .font(.footnote)
                            .fontWeight(.thin)
                            .foregroundStyle(.blue)
                    }
                    .padding()
                }
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}
struct MenuItemDetails: View {
    let item: MenuItem
    var body: some View{
        VStack(spacing: 20){
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 120,height: 120)
                .foregroundColor(.red)
            Text(item.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(item.price)
                .font(.title2)
                .fontWeight(.thin)
                .foregroundColor(.blue)
            Divider()
            Text(item.desc)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.green)
            Spacer()
        }
        .padding()
        .navigationTitle("About \(item.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    SimpleMenu()
}
