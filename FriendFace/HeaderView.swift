//
//  HeaderView.swift
//  FriendFace
//
//  Created by Nick Rice on 30/07/2021.
//

import SwiftUI


struct HeaderView: View {
    
    @ObservedObject var users = LoadUsers()
    
    var user: User

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("51")
                    .resizable()
                    .scaledToFit()
                
                Image("\(Int.random(in: 1...50))")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color("groupedBackground"), lineWidth: 8))
                    .offset(x: 0.0, y: 40)
                
                Image(user.isActive ? "online" : "offline")
                    .offset(x: 130, y: 65)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(users: LoadUsers(), user: User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["one", "two", "three"], friends: [Friend(id: "", name: "asd"), Friend(id: "", name: "asd")]))
            .previewLayout(.sizeThatFits)
    }
}
