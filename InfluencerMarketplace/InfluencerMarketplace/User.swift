//
//  UserProfile.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/26/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import Foundation

struct User: Codable{
    var name: String = "Example User"
    var following: Array<FollowingDetails>
    var myPrizes: Array<MyPrize>
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init(name: String, following: Array<FollowingDetails>, myPrizes: Array<MyPrize>){
        self.name = name
        self.following = following
        self.myPrizes = myPrizes
    }
    
    init?(json: Data?){
        if json != nil, let savedUser = try? JSONDecoder().decode(User.self, from: json!) {
            self = savedUser
        } else {
            return nil
        }
    }
    
    mutating func makePurchase(prize: Prize, from influencer: Influencer) {
        myPrizes.append(MyPrize(prize: prize, dateRecieved: Date(), influencer: influencer))
        
        //update following info
        if let index = following.firstIndex(where: {$0.influencer.name == influencer.name}){
            if following[index].currentPoints < prize.cost {
                print("Not enough points!")
                return
            }
            following[index].currentPoints -= prize.cost
            print(following[index].currentPoints)
        }
    }

}




