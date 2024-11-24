//
//  PullRequest.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation


struct PullRequest: Codable {
	let id = UUID()
	let user: RepositoryOwner
	let title: String
	let body: String?
	let createdAt: Date
	let closedAt: Date?
	let htmlUrl: String
	
	enum CodingKeys: String, CodingKey {
		case user
		case title
		case body
		case createdAt = "created_at"
		case closedAt = "closed_at"
		case htmlUrl = "html_url"
	}
}
