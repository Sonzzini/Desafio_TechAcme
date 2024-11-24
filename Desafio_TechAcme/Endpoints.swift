//
//  Endpoints.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

public struct Endpoints {
	public static let baseURL: String = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
	public static let challengeURL: String = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
}
