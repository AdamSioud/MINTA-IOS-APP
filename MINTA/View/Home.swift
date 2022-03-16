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

    Post(postImage: "post1",title: "Black Widow",description: "Natasha Romanoff, aka Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",starRating: 4),
    
    Post(postImage: "post2",title: "Loki",description: "Loki, the God of Mischief, steps out of his brother's shadow to embark on an adventure that takes place after the events of Avengers: Endgame",starRating: 5),
    
    Post(postImage: "post3",title: "Loki",description: "Living idealized suburban lives, super-powered beings Wanda and Vision begin to suspect that everything is not as it seems",starRating: 4),
    
    Post(postImage: "post4",title: "Falcon And the Winter Soldier",description: "Falcon and the Winter Soldier are a mismatched duo who team up for a global adventure that will test their survival skills -- as well as their patience.",starRating: 5),
    
    Post(postImage: "post5",title: "Mulan",description: "A girl disguises as a male warrior and joins the imperial army in order to prevent her sick father from being forced to enlist as he has no male heir.",starRating: 3),
    
    Post(postImage: "post6",title: "Avengers Endgame",description: "After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.",starRating: 5),
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
            SnapCarousel(spacing: getRect().height < 750 ? 15 : 20,trailingSpace: getRect().height < 750 ? 100 : 150,index: $currentIndex, items: posts) {post in
                
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
                
                ForEach(1...5,id: \.self){index in
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= post.starRating ? .yellow : .gray)
                }
                
                Text("(\(post.starRating).0)")
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





