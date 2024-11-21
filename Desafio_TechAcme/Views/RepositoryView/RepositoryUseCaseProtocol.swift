//
//  RepositoryUseCaseProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol RepositoryUseCaseProtocol {
	func execute(for owner: String, with repository: String, state: PullRequestStateRequest) async throws -> Result<[PullRequest], any Error>
}
