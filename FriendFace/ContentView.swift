//
//  ContentView.swift
//  FriendFace
//
//  Created by Nick Rice on 29/07/2021.
//

import SwiftUI

struct View2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("POP")
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView: View {
    
    @State private var navBarShowing = true
    
    @State var users = [User]()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color("groupedBackground"))
                
                NavigationView {
                    List {
                        Section(header: Text("Your friends (\(users.count))")) {
                            ForEach(users, id: \.id) { item in
                                NavigationLink(destination: DifferentDetailView(user: item)) {
                                    UserListView(user: item)
                                }
                            }
                        }
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .preferredColorScheme(.light)
                    .listStyle(InsetGroupedListStyle())
                    .onAppear(perform: loadData)
                }.accentColor(.black)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let decodedResponse = try? decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
