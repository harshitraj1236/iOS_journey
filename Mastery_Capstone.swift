import SwiftUI
struct Movie: Identifiable {
    let id = UUID()
    let title:String
    let genre: String
    let rating: Int
    let isWatched: Bool
}
struct Cinephile: View {
    let movies:[Movie]=[
        Movie(title: "Shawshank",genre: "Drama",rating: 9,isWatched: false),
        Movie(title: "Dark Knight",genre: "Action, Crime, Drama (Superhero hybrid)",rating: 10,isWatched: true),
        Movie(title: "Pulp Fiction",genre: "Crime, Drama, Thriller (Dark comedy elements)",rating: 7,isWatched: false),
        Movie(title: "Inception",genre: "Action, Adventure, Sci-Fi, Thriller",rating: 9,isWatched: false),
    ]
    var body: some View {
        NavigationStack{
            List(movies){movie in
                NavigationLink{
                    MovieDetails(movie:movie)
                }
                label:{
                    VStack(alignment: .leading){
                        Text(movie.title)
                            .font(.title)
                            .foregroundColor(.red)
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                        Text(movie.genre)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(.blue)
                            .fontDesign(.serif)
                        Text("Rating: \(movie.rating)/10")
                            .font(.title3)
                            .fontDesign(.monospaced)
                            .fontWeight(.heavy)
                            .foregroundColor(.mint.opacity(0.6))
                        Image(systemName: movie.isWatched ? "checkmark.circle.fill":"none")
                            .foregroundColor(movie.isWatched ? .green:.white)
                    }
                }
            }
            .navigationTitle("Cinephile")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
struct MovieDetails: View {
    let movie:Movie
    var body:some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(movie.title)
                .font(.largeTitle)
                .fontWeight(.heavy)

            Text(movie.genre)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.green)

            Text("Rating: \(movie.rating)/10")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.mint)
            if movie.rating >= 8 {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(Font.system(size:35))
                Text("Highly Recommended!")
                    .font(Font.system(size:20))
                    .fontWeight(.semibold)
                    .fontWidth(.standard)
                    .foregroundColor(.yellow.opacity(0.7))
            }
            else {
                Text("Decent Watch")
                    .font(Font.system(size:20))
                    .fontWeight(.semibold)
                    .fontWidth(.standard)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("About the \(movie.title)")
        .navigationBarTitleDisplayMode(.inline)
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
        )
        .padding()
        Spacer()
    }
}
#Preview {
    Cinephile()
}
