//
//  PersonController.swift
//  PotterReview
//
//  Created by adetokunbo babatunde on 6/23/20.
//  Copyright © 2020 adetokunbo babatunde. All rights reserved.
//

import Foundation

struct StringConstants {
    fileprivate static let baseURL = "https://swapi.dev/api"
    fileprivate static let peopleComponent = "people"

}
class PersonController {
    
    static func fetchPeople(completion: @escaping (Result<[Person], PersonError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURL) else {return completion(.failure(.invalidURL))}
        let finalURL = baseURL.appendingPathComponent(StringConstants.peopleComponent)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error)
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let people = topLevelObject.results
                return completion(.success(people))
            } catch {
                print(error)
                return completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
    
    static func fetchFilms(person: Person, completion: @escaping (Result<String, PersonError>) -> Void) {
        
        guard let filmString = person.films.first else {return completion(.success("Not in any films"))}
        guard let finalURL = URL(string: filmString) else {return completion(.failure(.invalidURL))}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error)
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return }
            do {
                let topLevelObject = try JSONDecoder().decode(FilmTopLevelObject.self, from: data)
                let title = topLevelObject.title
                return completion(.success(title))
            } catch {
                print(error)
                return completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }

}
