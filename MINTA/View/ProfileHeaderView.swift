//
//  ProfileHeaderView.swift
//  MINTA
//
//  Created by Even Lauvrak on 21/02/2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.mintaDarkBlue
            
            Image("headerBackground")
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            
            VStack(spacing: 35) {
                Spacer()
                Spacer()
                HStack {
                    Image("linkedin_bilde")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding(.horizontal)
                        .shadow(color: Color.mintaLightBlue.opacity(0.5),radius: 10)
                        .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 4))

                    VStack {
                        GroupBox {
                            HStack {
                                Spacer()
                                Text("@Lauvraken |")
                                    .foregroundColor(Color.mintaLightGray)

                                
                                Text("15")
                                    .foregroundColor(Color.mintaLightBlue)
                                    .fontWeight(.bold)
                                    
                                Text("NFTs")
                                
                                Spacer()
                            }
                            
                            .frame(height: 10)
                            
                        }
                        .opacity(0.9)
                        
                        Spacer()
                        HStack {
                            GroupBox {
                                HStack {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.mintaLightBlue)
                                    Text("Follow")
                                }
                                .frame(height: 10)
                                .scaledToFill()
                            }
                            GroupBox {
                                HStack {
                                    
                                    Image(systemName: "paperplane")
                                        .foregroundColor(Color.mintaLightBlue)
                                    Text("Message")
                                }
                                .frame(height: 10)
                                .scaledToFill()
                            }
                        }
                    }
                    Spacer()
                }
                .frame(height: 100)
                
//                Spacer()
                HStack {
                    Spacer()
                    
                    Image(systemName: "equal.square")
                    Spacer()
                    Image(systemName: "square.grid.2x2")
                        .opacity(0.5)
                    
                    Spacer()
                }
                .padding(.bottom)
                .font(.system(size: 25))


                
//                Spacer()
            }
        }
        .shadow(radius: 2)
        .frame(height: 280)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
