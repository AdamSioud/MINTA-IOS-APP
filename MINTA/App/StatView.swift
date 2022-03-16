//
//  StatView.swift
//  MINTA
//
//  Created by Adam Dybwad Sioud on 11/03/2022.
//

import SwiftUI

struct StatView: View {
    var pokemon: Pokemon
    var statName: String
    var statColor: Color
    var statValue: Int
    
    var body: some View {
        HStack{
            Text(statName)
                .font(.system(.body, design: .monospaced))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width:150, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue <= 100 ?
                           150 * (CGFloat(statValue) / 100) : 150,
            height:20)
            }
            Text("\(statValue)")
                .font(.system(.body, design: .monospaced))
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(pokemon: PokemonModel().MOCK_POKEMON, statName: "Atk", statColor: .blue, statValue: 55)
    }
}
