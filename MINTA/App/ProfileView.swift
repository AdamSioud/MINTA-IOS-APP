//
//  ProfileView.swift
//  MINTA
//
//  Created by Even Lauvrak on 21/02/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.mintaDarkBlue
            
            VStack(spacing: 0) {
                ProfileHeaderView()
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
