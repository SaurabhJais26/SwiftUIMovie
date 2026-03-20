//
//  TMDBAPIObject.swift
//  SwiftUIMovie
//
//  Created by Saurabh Jaiswal on 21/03/26.
//

import Foundation

struct TMDBAPIObject: Decodable {
    var results: [Title] = []
}
