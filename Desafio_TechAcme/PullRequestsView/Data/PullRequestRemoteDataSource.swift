//
//  PullRequestRemoteDataSource.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 22/11/24.
//

import Foundation

struct PullRequestRemoteDataSource: PullRequestDataSourceProtocol {
	
	func fetchPullRequests(request: PullRequestWebAccess.Request) async throws -> PullRequestWebAccess.Response {
		var url: URL? = nil
		
		if let state = request.state {
			url = URL(string: "https://api.github.com/repos/\(request.owner)/\(request.repository)/pulls?state=\(state)")
		} else {
			url = URL(string: "https://api.github.com/repos/\(request.owner)/\(request.repository)/pulls")
		}
		
		guard let url = url else { throw URLError(.badURL) }
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			print("fetchPullRequests(): Bad server response")
			throw URLError(.badServerResponse)
		}
		
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		
		do {
			return try decoder.decode(PullRequestWebAccess.Response.self, from: data)
		} catch {
			print("fetchPullRequests(): Could not parse response")
			throw URLError(.cannotParseResponse)
		}
	}
	
}
