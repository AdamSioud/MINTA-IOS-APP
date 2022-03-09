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
    
    @StateObject var loginController: LoginController

    
    var body: some View {
        ZStack {
            
            Color.mintaDarkBlue
            
            Button {
                GIDSignIn.sharedInstance.signOut()
                try? Auth.auth().signOut()
                loginController.isLoggedIn = false
                print("LOGGED OUT!")
                
            } label: {
                Text("LOGG UT")
            }

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(loginController: LoginController())
    }
}
