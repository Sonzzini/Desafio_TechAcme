//
//  RepositoryUseCaseImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RepositoryUseCaseImpl: RepositoryUseCaseProtocol {
	let repository: ReposRepositoryProtocol
	
	func execute(for owner: String, with repository: String, state: PullRequestStateRequest) async throws -> Result<[PullRequest], any Error> {
		do {
			let pullRequests = try await self.repository.getPullRequests(for: owner, with: repository, state: state)
			return .success(pullRequests)
		} catch {
			return .failure(error)
		}
	}
}
