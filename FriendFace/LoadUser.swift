//
//  LoadUser.swift
//  FriendFace
//
//  Created by Nick Rice on 31/07/2021.
//

import Foundation

class LoadUsers: ObservableObject {
    @Published var items = [User]()
    
    init() {
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
                        self.items = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
    
    func findUser(byName name: String) -> User? {
        if let user = items.first(where: { $0.name == name }) {
            return user
        }
        
        return items.first
    }
}
