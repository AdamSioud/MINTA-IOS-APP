//
//  Home.swift
//  Home
//
//  Created by Balaji on 17/09/21.
//

import SwiftUI

// Post Model and Sample Data...
struct Post: Identifiable{
    var id = UUID().uuidString
    var postImage: String
    var title: String
    var description: String
    var starRating: Int
}

var posts = [

    Post(postImage: "post1",title: "Welcome",description: "Welcome to our app, go through the next 5 steps to learn how to use it!",starRating: 1),
    
    Post(postImage: "post2",title: "Capture something",description: "Click in the middle of the tab-bar, find something awsome to capture, click the circle.",starRating: 2),
    
    Post(postImage: "post3",title: "Mint",description: "It easy to mint, just give it a title, and click the button mint.",starRating: 3),
    
    Post(postImage: "post4",title: "Explorer",description: "Go to the solana blockchain explorer and paste your TxID, you should find your NFT.",starRating: 4),
    
    Post(postImage: "post5",title: "Our website",description: "Want to know more? Go to our website: minta.world",starRating: 5),
    
    Post(postImage: "post6",title: "Follow us",description: "Be sure to check out our twitter and discord and leave a follow and become a member.",starRating: 6),
]

struct Home: View {
    // Current Index...
    @State var currentIndex: Int = 0
    var body: some View {
        
        ZStack{
            
            // background Tab View...
            TabView(selection: $currentIndex){
                
                ForEach(posts.indices,id: \.self){index in
                    
                    GeometryReader{proxy in
                        
                        Image(posts[index].postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width,height: proxy.size.height)
                            .cornerRadius(1)
                    }
                    .ignoresSafeArea()
                    .offset(y: -100)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            .overlay(
            
                LinearGradient(colors: [
                
                    Color.clear,
                    Color.black.opacity(0.2),
                    Color.white.opacity(0.4),
                    Color.white,
                    Color.white,
                    Color.white,
                    
                ], startPoint: .top, endPoint: .bottom)
                .background(
                
                    Color.black
                        .opacity(0.15)
                )
            )
            .ignoresSafeArea()
            
            // Posts....
            SnapCarousel(spacing: getRect().height < 850 ? 15 : 20,trailingSpace: getRect().height < 850 ? 100 : 150,index: $currentIndex, items: posts) {post in
                
                CardView(post: post)
            }
            .offset(y: getRect().height / 3.5)
        }
    }
    
    @ViewBuilder
    func CardView(post: Post)->some View{
        
        VStack(spacing: 10){
            
            // Image...
            GeometryReader{proxy in
                
                Image(post.postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .cornerRadius(25)
            }
            .padding(15)
            .background(Color.white)
            .cornerRadius(25)
            .frame(height: getRect().height / 2.5)
            .padding(.bottom,15)
            
            // Movie Data...
            Text(post.title)
                .font(.title2.bold())
            
            HStack(spacing: 3){
                
                ForEach(1...6,id: \.self){index in
                    
                    Image(systemName: "circle.fill")
                        .foregroundColor(index <= post.starRating ? .xPurpleDark : .xGrey)
                }
                
                Text("\(post.starRating)")
            }
            .font(.caption)
            
            Text(post.description)
                .font(getRect().height < 750 ? .caption : .callout)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding(.top,8)
                .padding(.horizontal,20)
        }
    }
}





