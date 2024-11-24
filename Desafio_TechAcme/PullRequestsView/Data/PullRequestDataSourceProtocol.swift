//
//  PullRequestDataSourceProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 22/11/24.
//

import Foundation

protocol PullRequestDataSourceProtocol {
	func fetchPullRequests(request: PullRequestWebAccess.Request) async throws -> PullRequestWebAccess.Response
}
