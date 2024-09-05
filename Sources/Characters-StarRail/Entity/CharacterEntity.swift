//
//  File.swift
//  
//
//  Created by Paul Frank on 30/12/23.
//

import Foundation

struct CharacterValue: Codable {
	let id, name, tag: String
	let rarity: Int
	let path, element: String
	let maxSP: Int
	let ranks, skills, skillTrees: [String]
	let icon, preview, portrait: String
	
	enum CodingKeys: String, CodingKey {
		case id, name, tag, rarity, path, element
		case maxSP = "max_sp"
		case ranks, skills
		case skillTrees = "skill_trees"
		case icon, preview, portrait
	}
}

typealias CharacterEntity = [String: CharacterValue]
