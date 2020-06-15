//
//  InfluencerPage.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/26/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct InfluencerPage: View {
    @EnvironmentObject var user: UserViewModel

    var influencer: Influencer
    
    var body: some View {
        GeometryReader{ geometry in
            List{
                InfluencerProfile(influencer: self.influencer, geometry: geometry).environmentObject(self.user)
//                    .navigationBarItems(leading: Text(" "))
                PrizesHeader(influencer: self.influencer).environmentObject(self.user)
                ForEach(self.influencer.prizes, id: \.name){ prize in
                    PrizeDisplay(prize: prize, influencer: self.influencer, geometry: geometry)
                        .frame(width: geometry.size.width)
                }
                
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct PrizesHeader: View {
    @EnvironmentObject var user: UserViewModel
    var influencer: Influencer
    
    var points: Int {
           if let index = user.following.firstIndex(where: {$0.influencer.name == influencer.name}){
               return user.following[index].currentPoints
           } else {
               return 0
           }
       }
    
    var body: some View {
        HStack{
            Text("Prizes")
            Spacer()
            Text("Total Points: \(self.points)")
        }
    }
    
}

struct InfluencerProfile: View {
    @EnvironmentObject var user: UserViewModel
    var influencer: Influencer
    var geometry: GeometryProxy

    
    var body: some View {
        VStack{
            HStack{
                InfluencerProfilePic(picture: influencer.picture)
                InfluencerHeader(influencer: influencer)
                Spacer()
            }
            .frame(height:125)
            .padding(.top)
            HStack{
                Text(influencer.bio)
                    .frame(width: geometry.size.width * 0.6)
                Spacer()
                FollowingButton(influencer: influencer).environmentObject(self.user)
            }
        }
    }
}

struct InfluencerHeader: View {
    var influencer: Influencer
    
    var body: some View {
        VStack(alignment: .leading){
            Text(influencer.name)
                .font(.title)
                .padding(.vertical)
            HStack{
                PrizeCount(numPrizes: influencer.prizes.count)
                    .padding(.trailing)
                FollowerCount(numFollowers: influencer.numFollowers)
            }
            Spacer()
        }
    }
}

struct InfluencerProfilePic: View {
    var picture: String
    
    var body: some View {
        Image(picture)
            .resizable()
            .scaledToFit()
            .frame(width: 120.0,height:120)
            .clipShape(Circle())
            .shadow(radius: 5)
            .padding(10)
    }
}

struct FollowingButton: View {
    @EnvironmentObject var user: UserViewModel
    var influencer: Influencer
    
    var following: Bool {
        return user.following.contains(where: {$0.influencer.name == influencer.name})
    }
    
    var body: some View {
        Group {
            if following {
                Button(action: {}, label: {
                    TextButton(text: "following")
                })
            } else {
                Button(action: {}, label: {
                    TextButton(text: "follow")
                })
            }
        }
    }
    
    struct TextButton: View{
        var text: String
        
        var body: some View{
            Text(text)
                //.frame(width: 100)
                .padding(.horizontal)
                .foregroundColor(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.gray)
                    .foregroundColor(Color.white)
            )
        }
    }
}

struct PrizeCount: View{
    @State var numPrizes: Int
    var body: some View{
        VStack{
            Text("\(self.numPrizes)")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text("Prizes")
        }
    }
}
struct FollowerCount: View{
    @State var numFollowers: Int
    var body: some View{
        VStack{
            Text("\(self.numFollowers)")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text("Followers")
        }
    }
}

struct PrizeCost: View {
    @State var cost: Int
    var body: some View{
        VStack{
            Text("Amount:")
            Text("\(self.cost) Points")
                .font(.system(size: 15))
                .fontWeight(.bold)
        }
    }
}

struct PrizeQuantity: View {
    @State var quantity: Int
    var body: some View{
        VStack{
            Text("Quantity:")
            Text("\(self.quantity)")
                .font(.system(size: 15))
                .fontWeight(.bold)
        }
    }
}
