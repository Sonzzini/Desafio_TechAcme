//
//  RepositoryResponse.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RepositoryResponse: Codable {
	let totalCount: Int
	let incompleteResults: Bool
	let items: [Repository]
	
	enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case incompleteResults = "incomplete_results"
		case items
	}
}
