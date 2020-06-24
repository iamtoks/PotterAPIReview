//
//  Person.swift
//  PotterReview
//
//  Created by adetokunbo babatunde on 6/23/20.
//  Copyright © 2020 adetokunbo babatunde. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let name: String
    let films: [String]
}

struct FilmTopLevelObject: Decodable {
    let title: String
}
