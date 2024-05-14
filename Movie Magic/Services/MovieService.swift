//
//  MovieService.swift
//  Movie Magic
//
//  Created by Matheus Franceschini on 13/05/24.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct MovieService {
    func getMovies() async throws -> [Movie] {
        
        let urlString: String = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            throw MovieServiceError.decodingError
        }
    }
}
