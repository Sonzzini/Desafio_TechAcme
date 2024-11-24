//
//  ReposRepositoryImpl.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RepositoryRepositoryImpl: RepositoryRepositoryProtocol {
	
	let remoteDataSource: RepositoryDataSourceProtocol
	
	func getRepositories(request: RepositoryWebAccess.Request) async throws -> [Repository] {
		do {
			let data = try await remoteDataSource.fetchRepository(request: request)
			
			return RepositoryMapper.mapRepoResponseToDomain(input: data)
		} catch {
			throw error
		}
	}
	
}

enum RepositoryMapper {
	static func mapRepoResponseToDomain(input response: RepositoryWebAccess.Response) -> [Repository] {
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


