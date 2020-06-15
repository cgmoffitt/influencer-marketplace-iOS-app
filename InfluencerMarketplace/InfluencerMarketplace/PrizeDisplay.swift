//
//  PrizeDisplay.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/27/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct PrizeDisplay: View {
    @EnvironmentObject var user: UserViewModel
    var prize: Prize
    var influencer: Influencer
    var geometry: GeometryProxy
    @State private var showPopover: Bool = false
    
    var body: some View {
        VStack{
            BasicPrizeInfo(prize: prize, geometry: geometry)
            .padding(.horizontal)
            Text(prize.description)
            .padding()
            RedeemButton(prize: prize, influencer: influencer).environmentObject(user)
        }
        .padding(.horizontal)
    }
}

struct PrizePicture: View {
    var picture: String
    var geometry: GeometryProxy
    
    var body: some View {
        Image(self.picture)
            .resizable()
            //.scaledToFit()
            .frame(width: geometry.size.width * 0.5 ,height: geometry.size.width * 0.5)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(Color.black)
        )
    }
}

struct BasicPrizeInfo: View {
    var prize: Prize
    var geometry: GeometryProxy
    
    var body: some View {
        VStack{
            Text(prize.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            HStack{
                PrizePicture(picture: prize.picture, geometry: geometry)
                VStack{
                    PrizeCost(cost:prize.cost)
                        .padding(.bottom)
                    PrizeQuantity(quantity:prize.quantity)
                }
            }
        }
    }
}
