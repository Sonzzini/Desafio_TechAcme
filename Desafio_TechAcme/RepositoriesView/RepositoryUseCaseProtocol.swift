//
//  RepositoryUseCaseProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol RepositoryUseCaseProtocol {
	func execute(request: RepositoryWebAccess.Request) async throws -> Result<[Repository], any Error>
}
