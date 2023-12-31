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
    
    // MARK: - Get Posts
    func getPosts(completion: @escaping(Result<[PostInfo], Error>) -> Void) {
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
                    completion(.success(response.posts ?? []))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Get Detail Post
    func getDetaiPost(id: String, completion: @escaping(Result<DetailPostInfo, Error>) -> Void) {
        guard let apiUrl = URL(string: ConstURL.detailPostURL.rawValue + "\(id)" + ConstURL.json.rawValue) else { fatalError("Invalid URL")
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiUrl) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(DetailPost.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response.post))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
