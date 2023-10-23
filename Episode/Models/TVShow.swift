//
//  TVShow.swift
//  Episode
//
//  Created by Øystein Engell on 23/10/2023.
//

import Foundation

struct TVShow: Codable {
    let id: Int
    let name: String
    let originalLanguage: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let genreIDs: [Int]
    let popularity: Float
    let firstAirDate: String
    let voteAverage: Float
    let voteCount: Int
    let originCountry: [String]
    let adult: Bool
    let mediaType: String
    let originalName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case originalLanguage = "original_language"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case adult
        case mediaType = "media_type"
        case originalName = "original_name"
    }
}


