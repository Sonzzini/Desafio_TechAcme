//
//  RemoteDataSource.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RemoteDataSource: DataSourceProtocol {
	
	func fetchRepository() async throws -> RepositoryResponse {
		guard let url = URL(string: Endpoints.challengeURL) else { throw URLError(.badURL) }
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			print("fetchRepository(): Bad server response")
			throw URLError(.badServerResponse)
		}
		
		do {
			return try JSONDecoder().decode(RepositoryResponse.self, from: data)
		} catch {
			print("fetchRepository(): Could not parse response")
			throw URLError(.cannotParseResponse)
		}
	}
	
	
	func fetchPullRequests(owner: String, repo: String, state: PullRequestStateRequest) async throws -> PullRequestResponse {
		let urlString = "https://api.github.com/repos/\(owner)/\(repo)/pulls?state=\(state.rawValue)"
		guard let url = URL(string: urlString) else { throw URLError(.badURL) }
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			print("fetchPullRequests(): Bad server response")
			throw URLError(.badServerResponse)
		}
		
		print("Response: \(response.statusCode)")
		
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		
		do {
			return try decoder.decode(PullRequestResponse.self, from: data)
		} catch {
			print("fetchPullRequests(): Could not parse response")
			throw URLError(.cannotParseResponse)
		}
	}
}
