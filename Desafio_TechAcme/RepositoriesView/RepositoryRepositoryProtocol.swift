//
//  ReposRepositoryProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol RepositoryRepositoryProtocol {
	func getRepositories(request: RepositoryWebAccess.Request) async throws -> [Repository]
}

