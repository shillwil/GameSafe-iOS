//
//  CoverPhoto.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct CoverPhoto: View {
    @State var coverPhoto: UIImage?
    var screen = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Image(uiImage: coverPhoto ?? UIImage(systemName: "photo.on.rectangle")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen, height: screen / 1.5)
                .clipped()
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CoverPhoto_Previews: PreviewProvider {
    static var previews: some View {
        CoverPhoto()
    }
}
