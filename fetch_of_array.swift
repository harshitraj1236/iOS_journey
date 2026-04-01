import SwiftUI
struct User: Codable, Identifiable{
    let id: Int
    let name: String
    let username: String
    let email: String
}
struct UserDetail: View {
    @State private var users: [User]=[]
    @MainActor
    func fetchUser() async{
        guard let url=URL(string: "https://jsonplaceholder.typicode.com/users")
        else{
            return
        }
        do{
            let (data,_)=try await URLSession.shared.data(from: url)
            self.users=try JSONDecoder().decode([User].self,from:data)
        }
        catch{
            print(error)
        }
    }
    var body: some View {
        List(self.users){user in
            VStack{
                Text(user.name)
                    .font(.system(size: 19,weight: .bold,design: .serif))
                Text(user.email)
                    .font(.system(size: 15,weight: .thin,design: .rounded))
                    .foregroundColor(Color.gray)
            }
            .multilineTextAlignment(.leading)
        }
        .listStyle(.automatic)
        .task {
            await self.fetchUser()
        }
    }
}
#Preview {
    UserDetail()
}
