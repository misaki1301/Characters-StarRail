//
//  File.swift
//  
//
//  Created by Paul Frank on 30/12/23.
//

import Foundation

class NetworkManager {
	
	static let shared  = NetworkManager()
	
	private init() {}
	
	enum Endpoints {
		static let characters = "https://raw.githubusercontent.com/Mar-7th/StarRailRes/bbe4da36a0e17410267c4dc53ada41716dee813f/index_new/en/characters.json"
	}
	
	func getCharacters() async throws -> CharacterEntity {
		guard let url = URL(string: Endpoints.characters) else {
			throw NetworkError.invalidUrl
		}
		let (data, response) = try await URLSession.shared.data(from: url)
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw NetworkError.invalidResponse
		}
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(CharacterEntity.self, from: data)
		} catch {
			throw NetworkError.invalidData
		}
	}
}

enum NetworkError: Error {
	case invalidData
	case invalidResponse
	case invalidUrl
	case message(_ error: Error?)
}
