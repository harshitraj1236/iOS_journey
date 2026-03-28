//
//  Github.swift
//  trainning
//
//  Created by Harshit Raj on 11/03/26.
//
//MVVM
//View for UI     Model for Data    ViewModel for Logic

import SwiftUI
import Foundation
import Combine

//
//struct FollowerData:Codable,Identifiable{
//    let login: String
//    let avatar_url:String
//    var id:String {login}
//}
//
//@MainActor
//class FollowersViewModel:ObservableObject{
//    @Published var followers:[FollowerData]=[]
//    func loadFollowers(username:String)async {
//        guard let url=URL(string: "https://api.github.com/users/\(username)/followers")
//        else{
//            print("BAD URL")
//            return
//        }
//        do{
//            let (data,response)=try await URLSession.shared.data(from:url)
//            guard let httpResponse=response as? HTTPURLResponse,httpResponse.statusCode==200
//            else{
//                return
//            }
//            self.followers=try JSONDecoder().decode([FollowerData].self, from: data)
//        }
//        catch{
//            print(error)
//        }
//    }
//}
//
//struct Github:View {
//    @StateObject private var viewModel:FollowersViewModel=FollowersViewModel()
//    @State private var username:String=""
//    var body: some View {
//        VStack(spacing:20){
//            TextField("Enter username",text: $username)
//                .textFieldStyle(.roundedBorder)
//                .padding(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.gray,lineWidth: 2)
//                )
//                .autocorrectionDisabled(true)
//                .autocapitalization(.none)
//            Button("Search"){
//                Task{
//                    await viewModel.loadFollowers(username: username)
//                }
//            }
//            .disabled(username.isEmpty)
//            List(viewModel.followers){follower in
//                Text(follower.login)
//            }
//        }
//        .padding()
//    }
//}


struct FollowerData: Codable, Identifiable {
    let login: String
    let avatar_url: String
    var id: String { login }
}


@MainActor
class FollowersViewModel: ObservableObject {
    @Published var followers: [FollowerData] = []
    @Published var isLoading = false
    
    func loadFollowers(username: String) async {
        guard !username.isEmpty
        else{
            return
        }
        
        let urlString = "https://api.github.com/users/\(username)/followers"
        guard let url = URL(string: urlString)
        else{
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
        //this is new
        var request = URLRequest(url: url)
        request.setValue("Github_Followers_Fetching_iOS", forHTTPHeaderField: "User-Agent")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse
            else{
                print("Invalid Response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                let decodedFollowers=try JSONDecoder().decode([FollowerData].self,from:data)
                self.followers=decodedFollowers
            }
            else{
                print("GitHub returned status \(httpResponse.statusCode)")
            }
        }
        catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}



struct Github: View {
    @StateObject private var viewModel = FollowersViewModel()
    @State private var username: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter username", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            
            Button {
                Task {
                    await viewModel.loadFollowers(username: username)
                }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                }
                else{
                    Text("Search Followers")
                        .bold()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(username.isEmpty || viewModel.isLoading)
            
            
            List(viewModel.followers) { follower in
                HStack {
                    
                    AsyncImage(url: URL(string: follower.avatar_url)) { image in
                        image.resizable()
                    } placeholder: {
                        Circle().fill(Color.secondary)
                    }
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    
                    Text(follower.login)
                        .font(.headline)
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    Github()
}
