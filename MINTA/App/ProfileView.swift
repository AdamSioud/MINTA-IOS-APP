//
//  ProfileView.swift
//  MINTA
//
//  Created by Even Lauvrak on 21/02/2022.
//

import SwiftUI
import Kingfisher


struct Pokemon: Identifiable, Decodable{
    
    let pokeID = UUID()
    
    var isFavorite = false
    
    let id: Int
    let name: String
    let imageURL: String
    let type: String
    let description: String
    
    let attack: Int
    let defense: Int
    let height: Int
    let weight: Int
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case imageURL = "imageUrl"
        case type
        case description
        case attack
        case defense
        case height
        case weight
    }
    var typeColor: Color {
            switch type {
            case "fire":
                return Color(.systemRed)
            case "poison":
                return Color(.systemGreen)
            case "water":
                return Color(.systemTeal)
            case "electric":
                return Color(.systemYellow)
            case "psychic":
                return Color(.systemPurple)
            case "normal":
                return Color(.systemOrange)
            case "ground":
                return Color(.systemBrown)
            case "flying":
                return Color(.systemBlue)
            case "fairy":
                return Color(.systemPink)
            default:
                return Color(.systemIndigo)
            }
    }
}

enum FetchError: Error {
    case badURL
    case badResponse
    case badData
}

class PokemonModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    init() {
        Task.init{
            pokemon = try await getPokemon()
        }
    }
    func getPokemon() async throws ->  [Pokemon] {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {
            throw FetchError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badResponse}
        guard let data = data.removeNullsFrom(string: "null,") else { throw FetchError.badData}
        let maybePokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
        return maybePokemonData
    }
    
    let MOCK_POKEMON = Pokemon(id: 0, name: "Bulbasaur", imageURL: "https://firebasestorage.googleapis.co...", type: "poison", description: "This is a test example of what the text in the description would look like for the given pokemon. This is a test example of what the text in the description would look like for the given pokemon.", attack: 49, defense: 52, height: 10, weight: 98)
    
    }

extension Data {
    func removeNullsFrom(string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

struct ProfileView: View {
    var pokemonModel = PokemonModel()
    @State private var pokemon = [Pokemon]()
    var body: some View {
        VStack(spacing: 0) {
         /*   ProfileHeaderView() */
        NavigationView {
            List(pokemon) {poke in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(poke.name.capitalized)
                            .font(.title)
                        HStack {
                            Text(poke.type.capitalized)
                                .italic()
                            Circle()
                                .foregroundColor(poke.typeColor)
                                .frame(width: 10, height: 10)
                        }
                        Text(poke.description)
                            .font(.caption)
                            .lineLimit(2)
                    }
                         
                    
                 /*   AsyncImage(url: URL(string:
                        poke.imageURL)) { phase in
                        switch phase {
                        case.empty:
                            ProgressView()
                        case.success(let image):
                            image.resizable()
                                .interpolation(.none)
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        case.failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    } */
                    
                    Spacer()
                    
                    KFImage(URL(string: poke.imageURL))
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
            .navigationTitle("MINTS")
        }
        
        .onAppear {
            Task.init {
                pokemon = try! await pokemonModel.getPokemon()
            }
        }

    }
}
}


/*
struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.black
            VStack(spacing: 0) {
              /*  ProfileHeaderView() */
                ScrollView {
//                    for n in 1...5 {
//                        Text("HELLO")
//                    }
                    ForEach(1...5, id: \.self) {_ in
                        MintItemView()
                            .padding(.horizontal)
//                            .padding(.bottom)
                            .padding(.top)
                    }
                }
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
    }
} */

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

