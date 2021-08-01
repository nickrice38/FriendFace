//
//  DifferentDetailView.swift
//  FriendFace
//
//  Created by Nick Rice on 01/08/2021.
//

import SwiftUI

struct DifferentDetailView: View {
    @ObservedObject var users = LoadUsers()
    
    var user: User
    
    var body: some View {
        ZStack {
            (Color("groupedBackground"))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderView(user: user)
                    .frame(height: 175)
                
                Spacer()
                
                
                Group {
                    Text(user.name)
                        .font(Font.title.weight(.bold))
                    
                    Text(user.email)
                        .foregroundColor(.secondary)
                }.offset(x: 0.0, y: 20)
                
                
                Form {
                    Section(header: Text("Address")) {
                        Text(user.address)
                    }
                    
                    Section(header: Text("About")) {
                        Text(user.about)
                    }
                    
                    Section(header: Text("Member since")) {
                        Text("\(user.formattedDate)")
                    }
                    
                    Section(header: Text("Tags")) {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(user.tags, id: \.self) { tag in
                                    Text(tag)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 7)
                                        .background(
                                            RoundedRectangle(cornerRadius: 100.00)
                                                .fill(Color.blue))
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Friends")) {
                        List(user.friends) { friend in
                            UserListView(user: self.users.findUser(byName: friend.name)!)
                        }
                    }
                }
                .offset(x: 0.0, y: 30)
                
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct DifferentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DifferentDetailView(users: LoadUsers(), user: User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["one", "two", "three"], friends: [Friend(id: "", name: "asd"), Friend(id: "", name: "asd")]))
    }
}
