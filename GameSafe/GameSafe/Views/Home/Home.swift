//
//  Home.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct Home: View {
    let gamesArray = ["Tronical", "Pipeline", "Scary Ghosts", "Space bytes"]
    var name: String?
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                CoverPhoto(coverPhoto: UIImage(named: "default-cover")!)
                
                VStack {
                    CircleImage(image: UIImage(named: "default-profile")!)
                        .padding(.top, UIScreen.main.bounds.height / 8)
                    
                    Text(name ?? "Dwayne Johnson")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    HStack {
                        Text("Favorite Games")
                            .font(.headline)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(gamesArray, id: \.self) { (game) in
                                GeometryReader { geometry in
                                    GameCell(gameImage: UIImage(named: game)!, gameName: game)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .frame(width: 200, height: 200)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.clear)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
