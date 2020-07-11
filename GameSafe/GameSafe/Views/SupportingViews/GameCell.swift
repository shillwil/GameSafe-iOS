//
//  GameCell.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct GameCell: View {
    @State var gameImage: UIImage?
    @State var gameName: String?
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image(uiImage: gameImage ?? UIImage(systemName: "gamecontroller.fill")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text(gameName ?? "New Game")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 0)
            }
        }
        .frame(width: 200, height: 200)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: .gray, radius: 6, x: 0, y: 6)
    }
}

struct GameCell_Previews: PreviewProvider {
    static var previews: some View {
        GameCell()
    }
}

