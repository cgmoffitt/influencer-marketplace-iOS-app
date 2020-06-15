//
//  ExampleData.swift
//  InfluencerMarketplace
//
//  Created by Chris Moffitt on 5/27/20.
//  Copyright © 2020 Chris Moffitt. All rights reserved.
//

import Foundation

struct ExampleData {
    static let USER_NAME = "Sam Good"
    static let MY_PRIZES = [MyPrize(prize: TiffanyHoughtonPhoneCallPrize, dateRecieved: Date(), influencer: TIFFANY_HOUGHTON)]
    
    //Example Influencers
    static let TIFFANY_HOUGHTON = Influencer(name: "Tiffany Houghton", picture: "Tiffany-Houghton", numFollowers: 10317, bio: "🎤 Pop Music | Radio Disney | Billboard | Teen Vogue | TikTok | Broadway", prizes: ExampleData.TIFFANY_HOUGHTON_PRIZES)
    static let JUSTIN_BIEBER = Influencer(name: "Justin Bieber", picture: "Justin-Bieber", numFollowers: 900874, bio: "🎤 Celebrity", prizes: ExampleData.JUSTIN_BIEBER_PRIZES)
    static let TURTLE_CREEK = Influencer(name: "Turtle Creek Lane", picture: "Turtle-Creek-Lane", numFollowers: 20341, bio: "👱‍♀️ Jen: Wife & Mom of 5 \n 🏡 Not your ordinary Interior Decorator", prizes: ExampleData.TURTLE_CREEK_PRIZES)
    static let KEVIN_CURRY = Influencer(name: "Kevin Curry", picture: "Kevin-Curry", numFollowers: 50687, bio: "Living life healthier & happier! 😄", prizes: ExampleData.KEVIN_CURRY_PRIZES)
    static let KIMMY_HOUGHTON = Influencer(name: "Kimmy Houghton", picture: "Kimmy-Houghton", numFollowers: 8632, bio: "👫 Weekly Date ideas \n 💕 Affordable Fashion", prizes: ExampleData.KIMMY_HOUGHTON_PRIZES)
    static let ADAM_GALLAGHER = Influencer(name: "Adam Gallagher", picture: "Adam-Gallagher", numFollowers: 67932, bio: "adam@iamgalla.com", prizes: ExampleData.ADAM_GALLAGHER_PRIZES)
    static let WHITNEY_SIMMONS = Influencer(name: "Whitney Simmons", picture: "Whitney-Simmons", numFollowers: 9573, bio: "Fitness Trainer", prizes: ExampleData.WHITNEY_SIMMONS_PRIZES)
    static let ED_SHEERAN = Influencer(name: "Ed Sheeran", picture: "Ed-Sheeran", numFollowers: 1465987, bio: "Celebrity", prizes: ExampleData.ED_SHEERAN_PRIZES)
    
    //Example Tiffany Prizes
    static let TiffanyHoughtonPhoneCallPrize = Prize(
        name: "Personal Phone Call", picture: "Tiffany-Houghton-Phone-Call-Prize", description: "I want to talk with you! Win this prize so we can plan a 20 minute phone call sometime 😄 I'll tell you about my secret plans for my next music release and you can tell me about your own goals! Maybe I can help 🤷‍♀️", quantity: 15, cost: 3000)
    static let TiffanyHoughtonDressPrize = Prize(
        name: "My favorite Dress", picture: "Tiffany-Houghton-Dress-Prize", description: "This is my favorite dress to wear to the beach! I think you'll like it too 😄", quantity: 30, cost: 500)
    static let TiffanyHoughtonMakeupPrize = Prize(
        name: "Makeup Survival Kit", picture: "Tiffany-Houghton-Makeup-Prize", description: "I never go anywhere without this set", quantity: 25, cost: 250)
    static let TIFFANY_HOUGHTON_PRIZES = [TiffanyHoughtonPhoneCallPrize, TiffanyHoughtonDressPrize, TiffanyHoughtonMakeupPrize]
    
    //Example Turtle Creek Lane Prizes
    static let TurtleCreekHalloweenPrize = Prize(
    name: "Halloween Decor Set", picture: "TurtleCreekHalloween", description: "Spook up your fall with my absolute favorite decorations", quantity: 25, cost: 250)
    static let TURTLE_CREEK_PRIZES = [TurtleCreekHalloweenPrize]
    
    //Example Kimmy Houghton Prizes
    static let KimmyGymPrize = Prize(
    name: "Gym starter pack", picture: "KimmyGym", description: "I take these essentials with me to workout every day!", quantity: 25, cost: 250)
    static let KIMMY_HOUGHTON_PRIZES = [KimmyGymPrize]
    
    //Example Adam Gallagher Prizes
    static let AdamColognePrize = Prize(
    name: "Manly™ Cologne", picture: "green-lavender-visual", description: "You’ll be truly yourself with my absolute favorite cologne", quantity: 25, cost: 250)
    static let ADAM_GALLAGHER_PRIZES = [AdamColognePrize]
    
    //Example Kevin Curry Prizes
    static let KevinGroceryPrize = Prize(
    name: "My Specialized Cookbook!", picture: "KevinCurryPrize", description: "Win some personalized advice and shopping tips from me AND a copy of my book!", quantity: 25, cost: 250)
    static let KEVIN_CURRY_PRIZES = [KevinGroceryPrize]
    
    //Example Whitney Simmons prizes
    static let SimonsGymsharkPrize = Prize(
    name: "Gym Shark fitness clothing", picture: "gymshark", description: "2 sets of workout clothes, your choice! These are my favorite!", quantity: 25, cost: 250)
    static let WHITNEY_SIMMONS_PRIZES = [SimonsGymsharkPrize]
    
    //Example Justin bieber prizes
    static let BieberConcertPrize = Prize(name: "VIP Justin Bieber Concert Tickets", picture: "bieber-concert", description: "I would love to see you!", quantity: 3, cost: 1000)
    static let JUSTIN_BIEBER_PRIZES = [BieberConcertPrize]
    
    //Example Ed Sheeran prizes
    static let SheeranGuitarLessons = Prize(name: "Guitar Lessons", picture: "sheeran-guitar", description: "let me help you become a pro guitarist", quantity: 1, cost: 10000)
    static let ED_SHEERAN_PRIZES = [SheeranGuitarLessons]
    
    static let INFLUENCERS: Array<Influencer> = [
        TIFFANY_HOUGHTON,
        JUSTIN_BIEBER,
        TURTLE_CREEK,
        KEVIN_CURRY,
        KIMMY_HOUGHTON,
        ADAM_GALLAGHER,
        WHITNEY_SIMMONS,
        ED_SHEERAN
    ]
    
    static let FOLLOWING: Array<FollowingDetails> = [
        FollowingDetails(influencer: TIFFANY_HOUGHTON, currentPoints: 6000),
        FollowingDetails(influencer: JUSTIN_BIEBER, currentPoints: 10),
        FollowingDetails(influencer: TURTLE_CREEK, currentPoints: 2000),
        FollowingDetails(influencer: KEVIN_CURRY, currentPoints: 50),
        FollowingDetails(influencer: KIMMY_HOUGHTON, currentPoints: 500),
        FollowingDetails(influencer: ADAM_GALLAGHER, currentPoints: 350),
        FollowingDetails(influencer: WHITNEY_SIMMONS, currentPoints: 20)
        //FollowingDetails(influencer: ED_SHEERAN, currentPoints: 5000)
    ]
}

