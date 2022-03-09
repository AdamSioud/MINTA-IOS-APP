//
//  GlobalHelpers.swift
//  MINTA
//
//  Created by Even Lauvrak on 19/02/2022.
//

import SwiftUI

extension Color {
    static let mintaDarkBlue = Color("mainBackground")
    static let mintaDarkerBlue = Color("customDarkerBlue")
    static let mintaGray = Color("customGray")
    static let mintaLightBlue = Color("customLightBlue")
    static let mintaLightGray = Color("customLightGray")
}

//class Helpers {
//    
//    @StateObject var viewRouter: ViewRouter
//    @State private var capturedImage: UIImage? = nil
//
//    
//    func getView() -> AnyView {
//        switch viewRouter.currentPage {
//        case .home:
//            return AnyView(HomeView())
//        case .camera:
//            return AnyView(CustomCameraView(capturedImage: $capturedImage))
//        case .profile:
//            return AnyView(ProfileView())
//        }
//    }
//    
//}
