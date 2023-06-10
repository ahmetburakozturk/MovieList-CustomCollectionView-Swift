//
//  MovieModel.swift
//  collectionViewTraining
//
//  Created by ahmetburakozturk on 20.05.2023.
//

import Foundation

class Movie {
    var movieName:String?
    var movieCategory:String?
    var movieImage:String?
    var movieYear:Int?
    var movieImdbRate:Double?
    
    init(movieName: String? = nil, movieCategory: String? = nil, movieImage: String? = nil, movieYear:Int? = nil, movieImdbRate:Double? = nil) {
        self.movieName = movieName
        self.movieCategory = movieCategory
        self.movieImage = movieImage
        self.movieYear = movieYear
        self.movieImdbRate = movieImdbRate
    }
    
    
}
