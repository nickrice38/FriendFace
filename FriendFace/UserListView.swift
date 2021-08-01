//
//  UserListView.swift
//  FriendFace
//
//  Created by Nick Rice on 01/08/2021.
//

import SwiftUI

struct UserListView: View {
    var user: User
    
    var body: some View {
        HStack {
            ZStack {
                Image("\(Int.random(in: 1...50))")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundColor(user.isActive ? Color.green : Color.red)
                    .offset(x: 14.0, y: 14.0)
            }
            .padding(.trailing, 8)
            .padding(.leading, 4)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .fontWeight(.semibold)
                Text(user.email)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(user: User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["one", "two", "three"], friends: [Friend(id: "", name: "asd"), Friend(id: "", name: "asd")]))
    }
}
