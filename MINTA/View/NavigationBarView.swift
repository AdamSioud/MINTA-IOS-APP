//
//  NavigationBarView.swift
//  MINTA
//
//  Created by Even Lauvrak on 19/02/2022.
//

import SwiftUI

struct NavigationBarView: View {
    @State private var isAnimated: Bool = false

    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(Color("customLightGray"))
            })//: BUTTON
            
            Spacer()
            
            HStack(spacing: 0) {
                Text("MINT")
                    .foregroundColor(.black)
                    .opacity(isAnimated ? 1 : 0)
                    .offset(x: isAnimated ? 0: -15, y: 0)
                    
                
                Text("A")
                    .foregroundColor(.blue)
                    .opacity(isAnimated ? 1 : 0)
                    .offset(x: isAnimated ? 0: 15, y: 0)
            }
            .frame(height: 30)
            .font(.title2)
            .onAppear(perform: {
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimated.toggle()
                }
            })
            
            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(Color("customLightGray"))
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                        
                }
            })//: BUTTON
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.mintaDarkBlue)
    }
}
