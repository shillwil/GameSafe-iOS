//
//  CircleImage.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    @State var image: UIImage?
    @State var imageFrame: CGFloat = 300
    
    var body: some View {
        Image(uiImage: image ?? UIImage(systemName: "person")!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageFrame, height: imageFrame)
            .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(lineWidth: 5)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 6, x: 0, y: 0)
        )
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}

