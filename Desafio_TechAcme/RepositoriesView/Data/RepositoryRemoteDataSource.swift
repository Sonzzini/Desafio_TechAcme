//
//  RemoteDataSource.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct RepositoryRemoteDataSource: RepositoryDataSourceProtocol {
	
	func fetchRepository(request: RepositoryWebAccess.Request) async throws -> RepositoryWebAccess.Response {
		var url = URL(string: "https://api.github.com/search/repositories?q=\(request.q)&sort=\(request.sort)")
		
		if let page = request.page {
			url = URL(string: "\(url?.absoluteString ?? "")&page=\(page)")
		}
		if let order = request.order {
			url = URL(string: "\(url?.absoluteString ?? "")&order=\(order)")
		}
		
		guard let url = url else { throw URLError(.badURL) }
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			print("fetchRepository(): Bad server response")
			throw URLError(.badServerResponse)
		}
		
		do {
			return try JSONDecoder().decode(RepositoryWebAccess.Response.self, from: data)
		} catch {
			print("fetchRepository(): Could not parse response")
			throw URLError(.cannotParseResponse)
		}
	}
	
	
	
}
