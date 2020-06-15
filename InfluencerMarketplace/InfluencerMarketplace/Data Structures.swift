//
//  Data Structures.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/26/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import Foundation

struct Influencer: Codable {
    var name: String
    var picture: String
    var numFollowers: Int
    var bio: String
    var prizes: Array<Prize>
    //purchases: Array<Purchase>
    
}

struct MyPrize: Codable {
    var prize: Prize
    var dateRecieved: Date
    var influencer: Influencer
}

struct Prize: Codable {
    var name: String
    var picture: String
    var description: String
    var quantity: Int
    var cost: Int
}

struct FollowingDetails: Codable {
    var influencer: Influencer
    var currentPoints: Int
}

//Purchase object?


