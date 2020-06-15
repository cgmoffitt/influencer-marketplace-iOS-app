//
//  RedeemButton.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 6/5/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI

struct RedeemButton: View{
    @EnvironmentObject var user: UserViewModel
    var prize: Prize
    var influencer: Influencer
    
    var alreadyWon: Bool {
        return user.myPrizes.contains(where: {$0.prize.name == prize.name})
    }
    
    var points: Int {
        if let index = user.following.firstIndex(where: {$0.influencer.name == influencer.name}){
            return user.following[index].currentPoints
        } else {
            return 0
        }
    }
    
    @State private var showingAlreadyWonAlert = false
    @State private var showingNotEnoughPointsAlert = false
    @State var showingConfirmWin = false
    @State var showingCongratulationsForWin = false
    @State var startCongratulations = false
    
    var body: some View {
        Group{
            if alreadyWon {
                Button(action: {
                    self.showingAlreadyWonAlert = true
                }, label: {
                    RedeemButtonContent(alreadyWon: self.alreadyWon)
                })
                .alert(isPresented: $showingAlreadyWonAlert, content: {
                    Alert(title: Text("Hi there"), message: Text("You've already won this prize :)"))
                })
                
            } else {
                Button(action: {
                    if self.points >= self.prize.cost{
                        self.showingConfirmWin = true
                    } else {
                        self.showingNotEnoughPointsAlert = true
                    }
                }, label: {
                    RedeemButtonContent(alreadyWon: self.alreadyWon)
                })
                .alert(isPresented: $showingNotEnoughPointsAlert , content: {
                    Alert(title: Text("Hi there"), message: Text("You don't have enough points for this prize yet, but keep saving up!"))
                })
            }
        }
        .sheet(isPresented: $showingConfirmWin){
            GeometryReader {geometry in
                ConfirmWinSheet(
                    showingCongratulationsForWin: self.$showingCongratulationsForWin,
                    prize: self.prize, influencer: self.influencer, geometry: geometry).environmentObject(self.user)
            }
        }
    }
    
    struct RedeemButtonContent: View{
        var alreadyWon: Bool
        
        var text: String{
            if alreadyWon { return "You won this prize!"}
            else { return "Redeem Points to Win!" }
        }
        
        var body: some View {
            Group{
                if alreadyWon {
                    Text(text)
                    .alreadyWonButtonStyle()
                } else {
                    Text(text)
                    .fontWeight(.bold)
                    .notYetWonButtonStyle()
                }
            }
        }
    }
}

struct PrizeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

//https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui
extension Color {
    init(_ hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

extension View {
    func notYetWonButtonStyle() -> some View {
        self.modifier(NotYetWonButtonStyle())
    }
    func alreadyWonButtonStyle() -> some View {
        self.modifier(AlreadyWonButtonStyle())
    }
}

struct NotYetWonButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .foregroundColor(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(Color(0x4EDA49))
            )
            .padding(.bottom)
    }
}

struct AlreadyWonButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .foregroundColor(Color.black)
            .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray))
            .padding(.bottom)
    }
}
