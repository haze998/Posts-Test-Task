//
//  NetworkManager.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    // MARK: - Get News
    func getPosts(completion: @escaping([PostInfo]) -> Void) {
        guard let apiUrl = URL(string: ConstURL.postsURL.rawValue) else { fatalError("Invalid URL")
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiUrl) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(Posts.self, from: data)
                DispatchQueue.main.async {
                    completion(response.posts ?? [])
                }
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
