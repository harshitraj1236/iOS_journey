//
//  Github_MVVS.swift
//  trainning
//
//  Created by Harshit Raj on 18/03/26.
//

import SwiftUI
import Foundation
import Combine

struct FollowersDataNew:Identifiable, Codable{
    let login:String
    let avatar_url:String
    var id: String{ login }
}


struct GithubService{
    
    func fetchFollowers(from username: String) async throws -> [FollowersDataNew] {
        
        
        let urlString = "https://api.github.com/users/\(username)/followers"
        guard let url = URL(string:urlString)
        else{
            throw URLError(.badURL)
        }
        
        var request=URLRequest(url: url)
        request.setValue("Github_MVVS_App_iOS", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 20
        
        let (data,response)=try await URLSession.shared.data(for: request)
        guard let httpResponse=response as? HTTPURLResponse,httpResponse.statusCode == 200
        else{
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([FollowersDataNew].self, from: data)
    }
}


@MainActor
class FollowersViewModelNew:ObservableObject{
    
    
    @Published var followers:[FollowersDataNew]=[]
    @Published var isLoading = false
    
    private var service=GithubService()
    
    func loadFollowers(for username:String) async {
        
        
        guard !username.isEmpty
        else{
            return
        }
        
        isLoading=true
        
        do{
            let fetchFollowers=try await service.fetchFollowers(from: username)
            self.followers=fetchFollowers
        }
        catch{
            print("Error in fetching followers: \(error.localizedDescription)")
        }
        
        isLoading=false
    }
}


struct Github_MVVS_ViewModel:View {
    
    @StateObject private var viewModel=FollowersViewModelNew()
    @State private var username:String=""
    
    var body: some View {
        VStack(spacing:30){
            TextField("Enter Username",text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4),lineWidth: 3)
                )
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Button{
                Task{
                    await viewModel.loadFollowers(for: username)
                }
            } label: {
                if viewModel.isLoading{
                    ProgressView()
                }
                else{
                    Text("Search Followers")
                        .font(.system(size: 18,weight: .heavy, design: .serif))
                        .padding(4)
                        .foregroundStyle(.black)
                }
            }
            .buttonBorderShape(.roundedRectangle(radius: 30))
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .disabled(viewModel.isLoading || username.isEmpty)
            
            List(viewModel.followers){follower in
                HStack{
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
            .listStyle(.sidebar)
        }
        .padding()
    }
}

#Preview {
    Github_MVVS_ViewModel()
}
