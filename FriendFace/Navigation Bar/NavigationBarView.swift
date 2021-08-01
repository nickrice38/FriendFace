//
//  NavigationBarView.swift
//  FriendFace
//
//  Created by Nick Rice on 31/07/2021.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        HStack {
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            Spacer()
            
            LogoView()
//                .opacity(isAnimated ? 1 : 0)
//                .offset(x: 0, y: isAnimated ? 0 : -25)
//                .onAppear(perform: {
//                    withAnimation(.easeOut(duration: 0.5)) {
//                        isAnimated.toggle()
//                    }
//                })
            
            Spacer()
            
            ZStack {
                Image(systemName: "envelope")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 14, height: 14)
                    .offset(x: 11, y: -8)
                
                Text("3")
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .offset(x: 11, y: -8)
            }
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
