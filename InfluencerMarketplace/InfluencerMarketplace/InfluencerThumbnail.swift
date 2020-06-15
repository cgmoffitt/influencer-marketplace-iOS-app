//
//  InfluencerThumbnail.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/27/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct InfluencerThumbnail: View {
    @ObservedObject var user: UserViewModel
    @State var influencer: Influencer
    
    var following: Bool {
        if user.following.firstIndex(where: {$0.influencer.name == influencer.name}) != nil{
            return true
        } else {
            return false
        }
    }
    
    var points: Int {
        if let index = user.following.firstIndex(where: {$0.influencer.name == influencer.name}){
            return user.following[index].currentPoints
        } else {
            return 0
        }
    }
    
    var body: some View{
        HStack{
            InfluencerThumbnailPic(influencer: influencer)
            VStack(alignment: .leading){
                Text(self.influencer.name)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .padding(.vertical)
                Text("Points: \(self.points)")
                .foregroundColor(Color.black)
            }
        }.frame(height:100)
    }
}

struct InfluencerThumbnailPic: View {
    var influencer: Influencer
    
    var body: some View{
        Image(influencer.picture)
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .frame(width: 100.0,height:100)
        .clipShape(Circle())
        .shadow(radius: 5)
        .padding(10)
    }
}
