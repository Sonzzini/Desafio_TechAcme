//
//  PullRequestUseCaseImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct PullRequestUseCaseImpl: PullRequestUseCaseProtocol {
	let repository: PullRequestRepositoryProtocol
	
	func execute(request: PullRequestWebAccess.Request) async throws -> Result<[PullRequest], any Error> {
		do {
			let pullRequests = try await self.repository.getPullRequests(request: request)
			return .success(pullRequests)
		} catch {
			return .failure(error)
		}
	}
}
