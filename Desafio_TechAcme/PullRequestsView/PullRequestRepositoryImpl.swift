//
//  PullRequestRepositoryImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 22/11/24.
//

import Foundation

struct PullRequestRepositoryImpl: PullRequestRepositoryProtocol {
	
	let remoteDataSource: PullRequestDataSourceProtocol
	
	func getPullRequests(request: PullRequestWebAccess.Request) async throws -> [PullRequest] {
		do {
			let data = try await remoteDataSource.fetchPullRequests(request: request)
			
			return PullRequestMapper.mapPullRequestResponseToDomain(input: data)
		} catch {
			throw error
		}
	}
	
}

enum PullRequestMapper {
	static func mapPullRequestResponseToDomain(input response: PullRequestWebAccess.Response) -> [PullRequest] {
		return response.items.map { pr in
			return PullRequest(user: pr.user,
									 title: pr.title,
									 body: pr.body,
									 createdAt: pr.createdAt,
									 closedAt: pr.closedAt,
									 htmlUrl: pr.htmlUrl)
		}
	}
}
