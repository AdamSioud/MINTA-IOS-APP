//
//  TabBarItemView.swift
//  MINTA
//
//  Created by Even Lauvrak on 19/02/2022.
//

import SwiftUI

struct TabBarItemView: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width: CGFloat
    let height: CGFloat
    let iconNameOn, iconNameOff: String
    
    var body: some View {
        VStack{
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    if viewRouter.currentPage != assignedPage {
                        viewRouter.currentPage = assignedPage
                    }
                }
            } label: {
                
                ZStack(alignment: .top) {
                    Image(systemName: viewRouter.currentPage == assignedPage ? iconNameOn : iconNameOff)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: height)
                        .foregroundColor(viewRouter.currentPage == .camera ? Color.xPurple :  Color.xPurpleDark)
                        .opacity(viewRouter.currentPage == assignedPage ? 1.0 : 0.3)
                        .padding(.top, 10)
                }
            }

            Spacer()
        }
    }
}

