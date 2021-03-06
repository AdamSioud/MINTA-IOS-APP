//
//  CustomTabBarView.swift
//  MINTA
//
//  Created by Even Lauvrak on 19/02/2022.
//

import SwiftUI

struct CustomTabBarView: View {
    @StateObject var viewRouter: ViewRouter
    let geometry: GeometryProxy

    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Spacer()
                
                TabBarItemView(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, iconNameOn: "questionmark.square.fill", iconNameOff: "questionmark.square")
                
                Spacer()
                
                TabBarItemView(viewRouter: viewRouter, assignedPage: .camera, width: geometry.size.width/5, height: geometry.size.height/28, iconNameOn: "photo.fill", iconNameOff: "photo")
                
                Spacer()
                
                TabBarItemView(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/5, height: geometry.size.height/28, iconNameOn: "person.crop.square.fill", iconNameOff: "person.crop.square")
                
                Spacer()
                                
            }
            .padding(.top)
            .frame(width: geometry.size.width, height: geometry.size.height/10)
            
            
            HStack {
                
                if viewRouter.currentPage == .profile {Spacer(minLength: geometry.size.width*0.7)}
                if viewRouter.currentPage == .home {Spacer()}
                
                LinearGradient(colors: [Color.xPurple, Color.xPurpleDark], startPoint: .top, endPoint: .bottom)
                    .frame(width: geometry.size.width/5,height: 4)
                .cornerRadius(4)
                
                if viewRouter.currentPage == .home {Spacer(minLength: geometry.size.width*0.7)}
                if viewRouter.currentPage == .profile {Spacer()}
            }
        }
        .clipped()
        .shadow(radius: 5)
    }
}


