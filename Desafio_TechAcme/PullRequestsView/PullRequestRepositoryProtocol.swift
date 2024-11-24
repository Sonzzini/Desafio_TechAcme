//
//  PullRequestRepositoryProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 22/11/24.
//

import Foundation

protocol PullRequestRepositoryProtocol {
	func getPullRequests(request: PullRequestWebAccess.Request) async throws -> [PullRequest]
}
