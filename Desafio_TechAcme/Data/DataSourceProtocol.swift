//
//  DataSourceProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol DataSourceProtocol {
	func fetchRepository() async throws -> RepositoryResponse
	func fetchPullRequests(owner: String, repo: String, state: PullRequestStateRequest) async throws -> PullRequestResponse
}
