//
//  LogoView.swift
//  FriendFace
//
//  Created by Nick Rice on 31/07/2021.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4) {
            Image("friendfacelogo2")
                .resizable()
                .scaledToFit()
                .frame(width: 170, height: 50)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
