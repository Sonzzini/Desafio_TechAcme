//
//  HomeUseCaseImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct HomeUseCaseImpl: HomeUseCaseProtocol {
	let repository: ReposRepositoryProtocol
	
	func execute() async throws -> Result<[Repository], any Error> {
		do {
			let repos = try await repository.getRepos()
			return .success(repos)
		} catch {
			return .failure(error)
		}
	}
}
