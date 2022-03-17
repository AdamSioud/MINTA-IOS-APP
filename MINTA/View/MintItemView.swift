//
//  MintItemView.swift
//  MINTA
//
//  Created by Even Lauvrak on 24/02/2022.
//

import SwiftUI

struct MintItemView: View {
    var body: some View {
        GroupBox {
            HStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .cornerRadius(8)
                    .shadow(radius: 8)
                
                VStack(spacing: 0) {
                    HStack(alignment: .top) {
                        Text("TITLE")
                            .padding(.leading)
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(.xWhite)
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.xGrey)
                    }
                    HStack {
                        Text("0.5")
                        Text("SOL")
                        Image("solana-sol-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 15)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    .foregroundColor(.gray)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .padding(.leading)
                    Spacer()
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            
                        Text("69")
                            .padding(.trailing)
                            .foregroundColor(.mintaLightGray)
                            .opacity(0.8)
                        Image(systemName: "bubble.left")
                            .foregroundColor(.mintaLightBlue)
                        Text("12 comments")
                            .foregroundColor(.mintaLightGray)
                            .opacity(0.8)
                        
                        Spacer()
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top)
                }
            }
        }
        .frame(height: 120)
        .shadow(radius: 5)
        .padding(.top)
        
    }
}

struct MintItemView_Previews: PreviewProvider {
    static var previews: some View {
        MintItemView()
    }
}
