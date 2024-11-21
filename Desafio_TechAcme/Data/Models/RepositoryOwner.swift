//
//  RepositoryOwner.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RepositoryOwner: Codable {
	let login: String
	let id: Int
	let avatarURL: String
	
	enum CodingKeys: String, CodingKey {
		case login
		case id
		case avatarURL = "avatar_url"
	}
}
