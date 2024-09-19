//
//  APICaller.swift
//  WifiFetcher
//
//  Created by Admin on 19.09.2024.
//

import Foundation

enum APIError: Error {
    case dataError
    case decodingError
    case urlError
}

class APICaller {
    
    static let shared = APICaller()
    
    private let url = "https://jsonplaceholder.typicode.com/todos"
    
    private init() {}
    
    public func fetchToDos(completion: @escaping (Result<[ToDo], APIError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.urlError))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            do {
                let todos = try JSONDecoder().decode([ToDo].self, from: data)
                completion(.success(todos))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }
        task.resume()
    }
    
    public func fetchFifthIdToDo(completion: @escaping (Result<[ToDo], APIError>) -> Void) {
        guard var url = URL(string: url) else {
            completion(.failure(.urlError))
            return
        }
        let queryItem = URLQueryItem(name: "id", value: "5")
        url.append(queryItems: [queryItem])
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            do {
                let todo = try JSONDecoder().decode([ToDo].self, from: data)
                completion(.success(todo))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }
        task.resume()
        
    }
}
