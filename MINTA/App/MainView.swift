//
//  MainView.swift
//  MINTA
//
//  Created by Even Lauvrak on 19/02/2022.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {

    @StateObject var viewRouter: ViewRouter
    @StateObject var loginController: LoginController
    @State private var capturedImage: UIImage? = nil

    func getView(loginController: LoginController) -> AnyView {
        switch viewRouter.currentPage {
        case .home:
            return AnyView(HomeView(loginController: loginController))
        case .camera:
            return AnyView(CustomCameraView(capturedImage: $capturedImage))
        case .profile:
            return AnyView(ProfileView())
        }
    }
        
    var body: some View {
        
        if Auth.auth().currentUser?.uid != nil {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    Color.mintaDarkBlue
                    
                    
                    VStack(spacing: 0) {
                        
                        getView(loginController: loginController)
                        
                        
                        CustomTabBarView(viewRouter: viewRouter, geometry: geometry)
                            .background(Color.mintaDarkerBlue)
                    }//: VSTACK
                    
                    
                }//: ZSTACK
                .ignoresSafeArea(.all)
            }//: GEOMETRYREADER
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
        }
        else {
            LoginView(loginController: loginController)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter(), loginController: LoginController())
    }
}
