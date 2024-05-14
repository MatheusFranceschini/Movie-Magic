//
//  Movie.swift
//  Movie Magic
//
//  Created by Matheus Franceschini on 06/05/24.
//

import Foundation

struct Movie: Decodable {
    let image: String
    let title: String
    let director: String?
    let rate: Double
    let synopsis: String
}

//let movies: [Movie] = [
//    Movie(image: "fallout", title: "Fallout", director: "Geneva Robertson-Dworet", rating: 8.5, description: "218 anos após o apocalipse, uma habitante pacífica de um agradável refúgio é forçada a se aventurar na superfície e fica chocada quando descobre a terra devastada que a espera."),
//    Movie(image: "shogun", title: "Shogun", director: "Jonathan van Tulleken", rating: 8.8, description: "Ambientado no século XVII, John Blackthorne, um marinheiro que passa de forasteiro a samurai, enquanto é usado como peão na luta do líder japonês Toranaga para chegar ao topo da cadeia governamental, ou Shogun."),
//    Movie(image: "baby-reindeer", title: "Bebê Rena", director: "Richard Gadd", rating: 8.0, description: "Segue o distorcido relacionamento do roteirista e ator Richard Gadd com sua stalker e o impacto que isso causa quando ele é forçado a enfrentar um trauma profundo e muito sombrio."),
//    Movie(image: "the-boys", title: "The Boys", director: "Eric Kripke", rating: 8.7, description: "Um grupo de vigilantes são dados o trabalho de deter super heroís que abusam da suas potências.")
//]
