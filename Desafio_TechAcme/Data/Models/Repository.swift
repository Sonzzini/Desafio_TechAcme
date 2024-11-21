//
//  Repository.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct Repository: Codable {
	let id: Int
	let name: String
	let fullName: String
	let htmlURL: String
	let description: String?
	let stargazersCount: Int
	let forksCount: Int
	let language: String?
	let owner: RepositoryOwner
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case fullName = "full_name"
		case htmlURL = "html_url"
		case description
		case stargazersCount = "stargazers_count"
		case forksCount = "forks_count"
		case language
		case owner
	}
}
