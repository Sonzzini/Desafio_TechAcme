//
//  PullRequestResponse.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct PullRequestResponse: Codable {
	let items: [PullRequest]
	
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		items = try container.decode([PullRequest].self)
	}
}
