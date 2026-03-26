//
//  fetch_data_in_data.swift
//  trainning
//
//  Created by Harshit Raj on 29/01/26.
//
import SwiftUI
struct Address: Codable {
    let city: String
    let street: String
}
struct UserAddress: Codable,Identifiable {
    let id: Int
    let name: String
    let email: String
    let address: Address
}
struct UserAddressList: View {
    @State private var address : [UserAddress]=[]
    @MainActor
    func fetchData() async{
        guard let url=URL(string: "https://jsonplaceholder.typicode.com/users")
        else{
            return
        }
        do{
            let (data,_)=try await URLSession.shared.data(from:url)
            self.address=try JSONDecoder().decode([UserAddress].self,from:data)
        }
        catch{
            print(error)
        }
    }
    var body: some View{
        List(self.address){addres in
            VStack(alignment: .leading){
                Text(addres.name)
                    .font(.system(size: 25,weight: .semibold,design: .serif))
                Text(addres.email)
                    .font(.system(size: 17,weight: .medium,design: .rounded))
                Text("City: \(addres.address.city)")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Text("Street\(addres.address.street)")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
        }
        .task {
            await fetchData()
        }
    }
}
#Preview {
    UserAddressList()
}
