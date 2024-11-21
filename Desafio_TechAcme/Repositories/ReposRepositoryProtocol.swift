//
//  ReposRepositoryProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol ReposRepositoryProtocol {
	func getRepos() async throws -> [Repository]
	func getPullRequests(for owner: String, with repo: String, state: PullRequestStateRequest) async throws -> [PullRequest]
}
