//
//  ContentView.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/26/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user: UserViewModel
    
    var body: some View{
        TabView {
            //MyFollowsView().environmentObject(user).tabItem({
            MyFollowsView().environmentObject(self.user).tabItem({
                Image(systemName: "person")
                Text("My Follows")
            })
            MyPrizesView().environmentObject(self.user).tabItem({
                Image(systemName:"gift")
                Text("Prizes")
            })
            DiscoverView().environmentObject(self.user).tabItem({
                Image(systemName: "magnifyingglass")
                Text("Discover")
            })
        }
        
    }
}
