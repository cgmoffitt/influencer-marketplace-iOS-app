//
//  DiscoverView.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/27/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct DiscoverView: View, Animatable {
    @EnvironmentObject var user: UserViewModel
    @State var influencerSearch: String = ""
    @State var showSearchResults: Bool = false;
    
    //Search through influencers and find those whose names start with what was entered in the search bar
    var influencerIndexes: Array<Int> {
        var indexes: Array<Int> = []
        for i in ExampleData.INFLUENCERS.indices {
            if ExampleData.INFLUENCERS[i].name.contains(influencerSearch){
                indexes.append(i)
            }
        }
        return indexes        
    }
    
    var userPoints: Int {
        if let followingIndex = user.following.firstIndex(where: {$0.influencer.name == influencerSearch}) {
            return user.following[followingIndex].currentPoints
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(influencerSearch: $influencerSearch)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                Group{
                    if ExampleData.INFLUENCERS.contains(where: {$0.name.contains(influencerSearch)}){
                        List{
                            ForEach(influencerIndexes, id: \.self){ i in
                                NavigationLink(destination:
                                    InfluencerPage(influencer: ExampleData.INFLUENCERS[i]).environmentObject(self.user), label: {
                                        InfluencerThumbnail(user: self.user, influencer: ExampleData.INFLUENCERS[i])
                                    })
                            }
                            
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

struct SearchBar: View, Animatable {
    @Binding var influencerSearch: String
    
    var body: some View{
        HStack{
            TextField("Search", text: $influencerSearch.animation())
            .padding(10)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                       Image(systemName: "magnifyingglass")
                           .foregroundColor(.gray)
                           .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                           .padding(.leading, 8)
                   }
            )
        }.padding([.top, .leading, .trailing])
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
