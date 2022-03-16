//
//  PokemonImage.swift
//  MINTA
//
//  Created by Adam Dybwad Sioud on 11/03/2022.
//

import SwiftUI
import Kingfisher

struct PokemonImage: View {
    var image: KFImage
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .background(Circle().foregroundColor(.white))
            .shadow(radius: 5)
    }
                     }

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(image: KFImage(URL(string: PokemonModel().MOCK_POKEMON.imageURL)))
    }
}
