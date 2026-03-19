//
//  async_img.swift
//  trainning
//
//  Created by Harshit Raj on 30/01/26.
//
import SwiftUI
struct Photo:Codable,Identifiable{
    let id: String
    let author: String
    let download_url: String
}
struct AsyncImg: View {
    @State private var gallery:[Photo]=[]
    let columns=[
        GridItem(.flexible())
    ]
    @MainActor
    func fetchData() async{
        guard let url=URL(string: "https://picsum.photos/v2/list")
        else{
            return
        }
        do{
            let (data,_)=try await URLSession.shared.data(from: url)
            self.gallery=try JSONDecoder().decode([Photo].self,from:data)
        }
        catch{
            print(error)
        }
    }
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(gallery) { photo in
                    AsyncImage(url:URL(string: photo.download_url)){image in
                        image
                            .resizable()
                            .scaledToFit()
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .clipped()
                    Text(photo.author)
                        .font(.system(size:20,weight: .semibold,design: .serif))
                        .foregroundColor(.brown)
                }
            }
        }
        .task {
            await self.fetchData()
        }
    }
}
#Preview {
    AsyncImg()
}
