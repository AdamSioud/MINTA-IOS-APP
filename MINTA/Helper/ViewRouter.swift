//
//  ViewRouter.swift
//  MINTA
//
//  Created by Even Lauvrak on 19/02/2022.
//

import Foundation

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .camera
}


enum Page {
    case home
    case camera
    case profile
}

class LoginController: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
