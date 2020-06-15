//
//  ConfirmWinSheet.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 6/5/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import SwiftUI
import AVFoundation


struct ConfirmWinSheet: View {
    @EnvironmentObject var user: UserViewModel
    @Binding var showingCongratulationsForWin: Bool
    var prize: Prize
    var influencer: Influencer
    var geometry: GeometryProxy
    
    @State var won: Bool = false
    
    @State var sparkleSoundEffect: AVAudioPlayer?
    func playSound(sound: String){
        if let path = Bundle.main.path(forResource: sound, ofType: nil){
            do {
                self.sparkleSoundEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                self.sparkleSoundEffect?.play()
                print("It's playing")
            } catch {
                print("Couldn't load file :(")
            }
        } else {
            print("didn't work")
        }
    }
    
    
    var points: Int {
        let index = user.following.firstIndex(where: {$0.influencer.name == influencer.name})
        return user.following[index!].currentPoints
    }
    
    var body: some View {
        VStack{
            Group {
                if !won {
                    VStack{
                        ConfirmPrompt(influencer: influencer).environmentObject(self.user)
                            .frame(height: geometry.size.height * 0.3)
                        BasicPrizeInfo(prize: prize, geometry: geometry)
                        Spacer()
                    }
                    .animation(.default)
                    .gesture(slideUp())
                    .offset(x: 0, y: self.verticalOffset)
                }
                else {
                    Fireworks() //From Amos Gyamfi https://dribbble.com/shots/9195730-SwiftUI-Full-Screen-Fireworks-Effect
                    .overlay(
                        VStack{
                            HStack{
                                InfluencerThumbnailPic(influencer: influencer)
                                Text("Congrats! You won my prize!")
                            }
                            PrizePicture(picture: prize.picture, geometry: geometry)
                            Text("You can see your prize in your Prizes tab!")
                            Spacer()
                            Text("(Slide down to exit)")
                        }
                        .animation(.default)
                    )
                }
            }
        }
    }
    
    @State private var steadyStateOffset: CGSize = .zero
    @GestureState private var gestureOffset: CGSize = .zero
    
    private var verticalOffset: CGFloat {
        steadyStateOffset.height + gestureOffset.height
    }
    
    private func slideUp() -> some Gesture {
        DragGesture()
            .updating($gestureOffset) { latestDragGestureValue, gestureOffset, transaction in
                gestureOffset = latestDragGestureValue.translation
        }
        .onEnded { finalDragGestureValue in
            if finalDragGestureValue.translation.height < -150{
                print(finalDragGestureValue.translation.height)
                print("You bought it!")
                withAnimation(.easeInOut(duration: 1)) {
                    self.playSound(sound: "sparkle.wav")
                    self.user.makePurchase(prize: self.prize, from: self.influencer)
                    self.won = true
                }
                
            } else {
                print(finalDragGestureValue.translation.height)
                print("You didn't buy it!")
            }
            withAnimation(.easeInOut(duration: 0.5)) {
                self.steadyStateOffset.height = 0
            }
        }
    }
    
    private struct ConfirmPrompt: View {
        @EnvironmentObject var user: UserViewModel
        var influencer: Influencer
        var points: Int {
            let index = user.following.firstIndex(where: {$0.influencer.name == influencer.name})
            return user.following[index!].currentPoints
        }
        
        var body: some View {
            VStack{
                Spacer()
                Divider()
                Text("My points: \(self.points)")
                Divider()
                Spacer()
                Text("You have enough points to win this prize!").font(.headline)
                Text("(Slide up to confirm and win!)").padding(.bottom)
                Spacer()
            }
            
        }
    }
}
