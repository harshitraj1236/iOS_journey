//
//  netmirror.swift
//  trainning
//
//  Created by Harshit Raj on 07/01/26.
//
import SwiftUI

struct NetMovie: Identifiable {
    let id = UUID()
    let name: String
    let genre: String
}

struct netmirror: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let sampleMovies: [NetMovie] = [
        NetMovie(name: "Inception", genre: "Sci-Fi"),
        NetMovie(name: "The Dark Knight", genre: "Action"),
        NetMovie(name: "Interstellar", genre: "Sci-Fi"),
        NetMovie(name: "Joker", genre: "Drama"),
        NetMovie(name: "Avatar", genre: "Fantasy"),
        NetMovie(name: "Oppenheimer", genre: "History"),
        NetMovie(name: "Dune", genre: "Sci-Fi"),
        NetMovie(name: "Tenet", genre: "Thriller"),
        NetMovie(name: "Gladiator", genre: "Action"),
        NetMovie(name: "Whiplash", genre: "Drama")
    ]
    
    func getColor(for genre: String) -> Color {
        switch genre {
        case "Action":   return .red
        case "Drama":    return .blue
        case "Fantasy":  return .green
        default:         return .gray
        }
    }

    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(sampleMovies) { movie in
                        NavigationLink(
                            destination: movieDetails(movie: movie)){
                            RoundedRectangle(cornerRadius: 12)
                                .fill(getColor(for: movie.genre))
                                .frame(height: 120)
                                .overlay(
                                    Text(movie.name)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .frame(maxWidth: .infinity,
                                               maxHeight: .infinity,
                                               alignment: .bottomLeading)
                                )
                        }
                    }
                }
                .padding()
            }
        }
    }
}
struct movieDetails: View {
    let movie: NetMovie
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "film.stack")
                .resizable()
                .scaledToFit()
                .frame(width: 360,height: 240)
            Text(movie.name)
                .font(.largeTitle)
                .bold()
            Text("Genre: \(movie.genre)")
                .font(.title2)
                .foregroundColor(.secondary)
        }
        Spacer()
    }
}
#Preview {
    netmirror()
}
