//
//  HomeView.swift
//  MINTA
//
//  Created by Even Lauvrak on 21/02/2022.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

struct HomeView: View {
    
    @State private var showWenView = false
    @StateObject var loginController: LoginController
    @State private var showWebView: Bool = false

    
    var body: some View {
        
     
            
            VStack {
                Home()
                Spacer()
                Button("SIGN OUT") {
                    GIDSignIn.sharedInstance.signOut()
                    try? Auth.auth().signOut()
                    loginController.isLoggedIn = false
                    print("LOGGED OUT!")
                    
                }.padding(.bottom, 8)
                    
                    .background(Color(red: 0.4, green: 0, blue: 0.5))
                    .clipShape(Capsule())
          
            }.background(Color.white)
            
            
            
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(loginController: LoginController())
    }
}
