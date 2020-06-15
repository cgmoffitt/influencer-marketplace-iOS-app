//
//  MyFollowsView.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/27/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct MyFollowsView: View {
    @EnvironmentObject var user: UserViewModel
    
    func getPoints(influencer: Influencer) -> Int {
        let index = user.following.firstIndex(where: {$0.influencer.name == influencer.name})
        return user.following[index!].currentPoints
    }
    
    var body: some View {
            NavigationView{
                VStack{
                    //HeadBar()
                    HStack{
                        Text("My Follows")
                            .font(.largeTitle).fontWeight(.semibold).multilineTextAlignment(.center).padding(.leading, 10.0)
                        Spacer()
                    }
                    Divider()
                        List{
                            ForEach(user.following.sorted(by: { a,b in
                                a.currentPoints > b.currentPoints
                            }), id: \.influencer.name){ details in
                                    NavigationLink(destination: InfluencerPage(influencer: details.influencer).environmentObject(self.user)){
                                            InfluencerThumbnail(user: self.user, influencer: details.influencer)
                                    }
                            }
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    Spacer()
                }
            }
    }
}



//struct MyFollowsView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let user = UserViewModel()
//        return MyFollowsView().environmentObject(user)
//    }
//}
