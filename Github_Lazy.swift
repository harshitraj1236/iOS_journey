//
//  Github_fetch.swift
//  trainning
//
//  Created by Harshit Raj on 11/02/26.
//

import SwiftUI
import Foundation

struct FollowersData: Codable, Identifiable {
    let login: String
    let avatar_url: String
    var id: String { login }
}

class FollowersDataFetch{
    static let shared=FollowersDataFetch()
    private init() {}
    func fetchUser(from username: String) async throws -> [FollowersData]{
        guard let url=URL(string:"https://api.github.com/users/\(username)/followers")
        else{
            throw URLError(.badURL)
        }
        let (data,response)=try await URLSession.shared.data(from: url)
        guard let httpResponse=response as? HTTPURLResponse , httpResponse.statusCode==200
        else{
            throw URLError(.badServerResponse)
        }
        let followers=try JSONDecoder().decode([FollowersData].self,from:data)
        return followers
    }
}

struct Github_fetch: View{
    @State private var followers:[FollowersData]=[]
    @State private var username:String=""
    var body: some View{
        VStack{
            TextField("Enter Username",text:$username)
                .textFieldStyle(.roundedBorder)
                .padding()
                .autocorrectionDisabled()
                .autocapitalization(.none)
            Button {
                Task{
                    await fetchLoad(username: username)
                }
            } label: {
                Text("Search")
                    .font(.system(size:18,weight:.bold,design: .serif))
                    .foregroundColor(.black)
            }
            .buttonStyle(.glassProminent)
            .disabled(username.isEmpty)
            List(followers){follower in
                HStack{
                    AsyncImage(url: URL(string:follower.avatar_url)){image in
                        image
                            .resizable()
                            .scaledToFit()
                    }placeholder:{
                        ProgressView()
                    }
                    .frame(width: 50,height: 50)
                    .clipped()
                    Text(follower.login)
                        .font(.headline)
                }
            }
        }
    }
    func fetchLoad(username:String) async{
        do{
            followers=try await FollowersDataFetch.shared.fetchUser(from: username)
        }
        catch{
            print(error)
        }
    }
}
#Preview {
    Github_fetch()
}
