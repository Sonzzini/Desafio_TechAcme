//
//  PullRequestResponse.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

enum PullRequestWebAccess {
	struct Request {
		let owner: String
		let repository: String
		let state: String?
	}
	
	struct Response: Codable {
		let items: [PullRequest]
		
		init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			items = try container.decode([PullRequest].self)
		}
	}
}
