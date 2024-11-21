//
//  ReposRepositoryImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct ReposRepositoryImpl: ReposRepositoryProtocol {
	let remoteDataSource: DataSourceProtocol
	
	func getRepos() async throws -> [Repository] {
		do {
			let data = try await remoteDataSource.fetchRepository()
			
			return RepositoryMapper.mapRepoResponseToDomain(input: data)
		} catch {
			throw error
		}
	}
	
	func getPullRequests(for owner: String, with repo: String, state: PullRequestStateRequest) async throws -> [PullRequest] {
		do {
			let data = try await remoteDataSource.fetchPullRequests(owner: owner, repo: repo, state: state)
			
			return PullRequestMapper.mapPullRequestResponseToDomain(input: data)
		} catch {
			throw error
		}
	}
	
}

enum RepositoryMapper {
	static func mapRepoResponseToDomain(input response: RepositoryResponse) -> [Repository] {
		return response.items.map { repo in
			return Repository(id: repo.id,
									name: repo.name,
									fullName: repo.fullName,
									htmlURL: repo.htmlURL,
									description: repo.description,
									stargazersCount: repo.stargazersCount,
									forksCount: repo.forksCount,
									language: repo.language,
									owner: repo.owner)
		}
	}
}

enum PullRequestMapper {
	static func mapPullRequestResponseToDomain(input response: PullRequestResponse) -> [PullRequest] {
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
