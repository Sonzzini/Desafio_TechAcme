//
//  RepositoryUseCaseImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RepositoryUseCaseImpl: RepositoryUseCaseProtocol {
	let repository: RepositoryRepositoryProtocol
	
	func execute(request: RepositoryWebAccess.Request) async throws -> Result<[Repository], any Error> {
		do {
			let repos = try await repository.getRepositories(request: request)
			return .success(repos)
		} catch {
			return .failure(error)
		}
	}
}
