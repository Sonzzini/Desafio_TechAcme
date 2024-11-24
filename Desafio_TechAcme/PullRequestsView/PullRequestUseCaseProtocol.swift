//
//  PullRequestUseCaseProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol PullRequestUseCaseProtocol {
	func execute(request: PullRequestWebAccess.Request) async throws -> Result<[PullRequest], any Error>
}
