import SwiftUI
struct PhotoError:Codable,Identifiable{
    let id: String
    let author: String
    let download_url: String
}
struct FetchError: View {
    let columns=[GridItem(.flexible())]
    @State private var photos:[PhotoError]=[]
    @State private var showAlert:Bool=false
    @State private var errorMessage:String=""
    @MainActor
    func fetchData() async {
        guard let url=URL(string:"https://picsum.photos/bad_url")
        else{
            return
        }
        do{
            let (data,_)=try await URLSession.shared.data(from:url)
            self.photos=try JSONDecoder().decode([PhotoError].self,from:data)
        }
        catch{
            errorMessage="Could not load images. Please check your internet."
            showAlert=true
        }
    }
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns){
                ForEach(photos){photo in
                    VStack{
                        AsyncImage(url: URL(string:photo.download_url)){image in
                            image
                                .resizable()
                                .scaledToFit()
                        }placeholder: {
                            ProgressView()
                        }
                        .frame(height: 100)
                        .clipped()
                        Text(photo.author)
                            .font(.system(size:20,weight: .semibold,design: .serif))
                            .foregroundColor(.brown)
                    }
                }
            }
        }
        .task {
            await fetchData()
        }
        .alert("Something Wrong!", isPresented: $showAlert){
            Button("Cancel",role: .cancel){}
            Button {
                Task{
                    await fetchData()
                }
            } label: {
                Text("Retry")
            }

        }message:{
            Text(errorMessage)
        }
    }
}
#Preview {
    FetchError()
}
