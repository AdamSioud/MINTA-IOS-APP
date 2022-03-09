//
//  LoginView.swift
//  MINTA
//
//  Created by Even Lauvrak on 24/02/2022.
//

import SwiftUI
import GoogleSignIn
import Firebase

struct LoginView: View {
    
    // Loading Indicator...
    @State var isLoading: Bool = false
    @StateObject var loginController: LoginController
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        
        VStack{
            
            // Top Image....
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: getRect().height / 3)
                .padding(.horizontal,15)
                .offset(y: -10)
            // Background Circle....
                .background(
                
                    Circle()
                        .fill(Color("LightBlue"))
                    // Apllying Sclae...
                    // Simply Apply Scale from bottom...
                    // So it will be perfect..
                        .scaleEffect(2,anchor: .bottom)
                    // Slighly moving...
                        .offset(y: 6)
                )
            
            // Text...
            VStack(spacing: 20){
                
                Text("Bridging the real world with the metaverse!")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .kerning(1.1)
                    .foregroundColor(Color.black.opacity(0.8))
                    .multilineTextAlignment(.center)
                
                // Sign In Button....
                
                Button {
                    handleLogin(loginController: loginController)
                } label: {
                    
                    HStack(spacing: 15){
                        
                        Image("google")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                        
                        Text("Sign in")
                            .font(.title3)
                            .fontWeight(.medium)
                            .kerning(1.1)
                    }
                    .foregroundColor(Color("Blue"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    // Capsuled Border...
                    .background(
                    
                        Capsule()
                            .strokeBorder(Color("Blue"))
                    )
                }
                .padding(.top,25)
                
                // Terms Text...
                if #available(iOS 15, *) {
                    Text( "By creating an account, you are agreeing to our Terms of Service")
                        
                        .foregroundColor(.gray)
                        .kerning(1.1)
                        .lineSpacing(8)
                        .multilineTextAlignment(.center)
                    // Moving Bottom
                        .frame(maxHeight: .infinity,alignment: .bottom)
                        .padding(.bottom,10)
                } else {
                    // Fallback on earlier versions
                    Text("By creating an account, you are agreeing to our Terms of Service")
                        
                        .foregroundColor(.gray)
                        .kerning(1.1)
                        .lineSpacing(8)
                        .multilineTextAlignment(.center)
                    // Moving Bottom
                        .frame(maxHeight: .infinity,alignment: .bottom)
                        .padding(.bottom,10)
                }
            }
            .padding()
            .padding(.top,40)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .overlay(
        
            ZStack{
                
                if isLoading{
                    Color.black
                        .opacity(0.25)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .font(.title2)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        )
    }
    
   
    
    // handle Login..
    func handleLogin(loginController: LoginController){
        
        // Google Sign in...
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        isLoading = true
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self] user, err in
            
            if let error = err {
                isLoading = false
                print(error.localizedDescription)
              return
            }

            guard
              let authentication = user?.authentication,
              let idToken = authentication.idToken
            else {
                isLoading = false
              return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            // Firebase Auth...
            Auth.auth().signIn(with: credential) { result, err in
                
                isLoading = false
                
                if let error = err {
                    print(error.localizedDescription)
                  return
                }
                
                // Displaying User Name...
                guard let user = result?.user else{
                    return
                }
                
                loginController.isLoggedIn = true
                print(user.displayName ?? "Success!")
                
                // Updating User as Logged in
                withAnimation{
                    log_Status = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @StateObject var loginController = LoginController()

    static var previews: some View {
        LoginView(loginController: LoginController())
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    // Retreiving RootView COntroller...
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}

