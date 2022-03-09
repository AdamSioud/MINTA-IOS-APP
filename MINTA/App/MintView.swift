//
//  MintView.swift
//  MINTA
//
//  Created by Even Lauvrak on 23/02/2022.
//

import SwiftUI

struct MintView: View {
    
    @State var image: UIImage?
    @State private var title: String = ""
    @Environment(\.presentationMode) private var presentationMode

    
    var body: some View {
        ZStack {
            
            Color.mintaDarkBlue
            
            VStack {
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            
                            Text("Exit")
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.mintaLightBlue)
                        .padding()
                    }
                    Spacer()
                }
                
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(8)
                        .shadow(radius: 8)
                }
                else {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(8)
                        .shadow(radius: 8)
                }
                
                
                TextField("Enter title..", text: $title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.mintaLightGray)
                    .padding()
                
                Spacer()
                
                Button {
                    //
                } label: {
                    
                    Text("MINT")
                        .fontWeight(.semibold)
                    
                }
                .frame(width: 120, height: 40)
                .tint(.mintaDarkBlue)
                .background(Color.mintaLightBlue)
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding(.bottom, 40)
                
                
                
                
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MintView_Previews: PreviewProvider {
    static var previews: some View {
        MintView()
    }
}
