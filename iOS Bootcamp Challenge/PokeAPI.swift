//
//  PokeAPI.swift
//  iOS Bootcamp Challenge
//
//  Created by Jorge Benavides on 26/09/21.
//

import Foundation

class PokeAPI {

    static let shared = PokeAPI()
    static let baseURL = "https://pokeapi.co/api/v2/"

    // TODO: Implements generics to merge this methods into one
    
    func fetchGenericJSONData<T: Decodable>(url: String, onCompletion: @escaping(T?, Error?) ->  ()){
        let path = url.replacingOccurrences(of: PokeAPI.baseURL, with: "")
        let task = URLSession.mock.dataTask(with: PokeAPI.baseURL + path, completionHandler: { data, _, error in
            guard let data = data else {
                onCompletion(nil, error)
                return
            }
            do {
                let entity = try JSONDecoder().decode(T.self, from: data)
                onCompletion(entity, error)
            } catch {
                onCompletion(nil, error)
            }
        })
        task?.resume()
        return task
    }

    @discardableResult
    func get(url: String, onCompletion: @escaping(PokemonList?, Error?) -> Void) -> URLSessionDataTask? {
        
        fetchGenericJSONData(url: url, onCompletion: onCompletion)
    }

    @discardableResult
    func get(url: String, onCompletion: @escaping(Pokemon?, Error?) -> Void) -> URLSessionDataTask? {
        fetchGenericJSONData(url: url, onCompletion: onCompletion)
    }
}
