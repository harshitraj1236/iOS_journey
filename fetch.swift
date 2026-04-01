import SwiftUI
struct QuoteData: Codable{
    let id: Int
    let quote: String
    let author: String
}
struct QuotePage: View {
    @State private var quoteText: String = ""
    @State private var quoteAuthor: String = ""
    func fetchQuote() async {
        guard let url=URL(string: "https://dummyjson.com/quotes/random")
        else{
            return
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let decoder = try JSONDecoder().decode(QuoteData.self, from: data)
            await MainActor.run {
                quoteText=decoder.quote
                quoteAuthor=decoder.author
            }
        }
        catch{
            print("Fetching Error:",error)
        }
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.8))
                .frame(maxWidth: .infinity, maxHeight: 250)
            VStack(spacing: 16) {
                Text(quoteText.isEmpty ? "Loading..." : quoteText)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text(quoteAuthor.isEmpty ? "" : "— \(quoteAuthor)")
                    .font(.system(size: 19,weight: .semibold,design: .serif))
                    .foregroundColor(.purple)
                Button("New Quote") {
                    Task {
                        await fetchQuote()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .task {
                await fetchQuote()
            }
        }
        .padding()
        Spacer()
    }
}
#Preview {
    QuotePage()
}
