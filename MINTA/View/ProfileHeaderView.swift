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
                .frame(height: 80)
                .clipped()
            
            VStack(spacing: 5) {
                Spacer()
                Spacer()
                HStack {
                    Image("linkedin_bilde")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .padding(.horizontal)
                        .shadow(color: Color.mintaLightBlue.opacity(0.5),radius: 10)
                        .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 4))

                    VStack {
                        GroupBox {
                            HStack {
                                Spacer()
                                Text("@Satoshi |")
                                    .foregroundColor(Color.mintaLightGray)

                                
                                Text("15")
                                    .foregroundColor(Color.mintaLightBlue)
                                    .fontWeight(.bold)
                                    
                                Text("MINTS")
                                
                                Spacer()
                            }
                            .scaledToFill()
                            .frame(height: 20)
                            
                        }
                        .opacity(0.9)
                        
                        Spacer()
                    /*    HStack {
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
                    }*/
                    }
                 /*   Spacer()*/
                }
                .frame(height: 100)
                
          /*     Spacer()
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

                 */
                
//                Spacer()
            }
        }
        .shadow(radius: 2)
        .frame(height: 280)
        .cornerRadius(4)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
