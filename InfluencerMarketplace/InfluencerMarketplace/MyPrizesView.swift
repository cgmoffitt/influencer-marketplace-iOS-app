//
//  MyPrizesView.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/27/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct MyPrizesView: View {
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                //HeadBar()
                HStack{
                    Text("My Prizes")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 10.0)
                    Spacer()
                }
                Divider()
                List{
                    ForEach(self.user.myPrizes, id: \.prize.name){ myPrize in
                        MyPrizeDisplay(myPrize: myPrize, geometry: geometry).environmentObject(self.user)
                            .frame(width: geometry.size.width)
                    }
                }
            }
        }
    }
}

struct MyPrizeDisplay: View {
    @EnvironmentObject var user: UserViewModel
    var myPrize: MyPrize
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading){
            FromInfluencer(myPrize: myPrize).environmentObject(self.user)
            DateRecieved(myPrize: myPrize)
            PrizeDisplay(prize: myPrize.prize, influencer: myPrize.influencer, geometry: geometry).environmentObject(self.user)
        }
    }
}

struct FromInfluencer: View {
    @EnvironmentObject var user: UserViewModel
    var myPrize: MyPrize
    
    var points: Int {
        let index = user.following.firstIndex(where: {$0.influencer.name == myPrize.influencer.name})
        return user.following[index!].currentPoints
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("From:")
            InfluencerThumbnail(user: self.user, influencer: myPrize.influencer)
        }
    }
}

struct DateRecieved: View{
    var myPrize: MyPrize
    
    var date: Date {
        myPrize.dateRecieved
    }
    let calendar = Calendar.current
    var components: DateComponents {
        calendar.dateComponents([.year, .month, .day], from: date)
    }

    
    var body: some View {
        HStack{
            Text("Date Recieved: \(components.month!)/\(components.day!)/\(String(components.year!))").padding(.vertical)
            Spacer()
        }
    }
}

struct MyPrizesView_Previews: PreviewProvider {
    static var previews: some View {
        let user = UserViewModel()
        return MyPrizesView().environmentObject(user)
    }
}
