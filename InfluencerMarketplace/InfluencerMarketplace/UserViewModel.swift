//
//  UserViewModel.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/26/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published private var user: User
    
    private var autosaveCancellable: AnyCancellable?
    
    init(){
        
        let defaultsKey = "UserViewModel.untitled"
        
        user = User(json: UserDefaults.standard.data(forKey: defaultsKey)) ?? User(name: ExampleData.USER_NAME, following: ExampleData.FOLLOWING, myPrizes: ExampleData.MY_PRIZES)
        
        autosaveCancellable = $user.sink { user in
            UserDefaults.standard.set(user.json, forKey: defaultsKey)
        }
    }
    
    var following: Array<FollowingDetails> {
        return user.following
    }
    
    var name: String {
        return user.name
    }
    
    var myPrizes: Array<MyPrize>{
        return user.myPrizes
    }
    
    func makePurchase(prize: Prize, from influencer: Influencer){
        user.makePurchase(prize: prize, from: influencer)
    }
}

