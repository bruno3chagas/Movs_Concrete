//
//  MovieEntity.swift
//  DesafioConcrete_BrunoChagas
//
//  Created by Bruno Chagas on 23/07/19.
//  Copyright © 2019 Bruno Chagas. All rights reserved.
//

import ObjectMapper

class MovieEntity: Mappable {
    
    var id: Int?
    var name: String?
    var releaseYear: Int?
    //var genres: [Genre]
    //var poster: Poster
    var movieDescription: String?
    var isFavorite: Bool?

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        releaseYear <- map["releaseYear"]
        movieDescription <- map["movieDescription"]
        
    }
}
