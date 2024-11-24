//
//  Desafio_TechAcmeTests.swift
//  Desafio_TechAcmeTests
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Testing
@testable import Desafio_TechAcme

struct Desafio_TechAcmeTests {
	
	@Test func RepositoryDecoding() async throws {
		let dataSource = MockDataSource()
		
		let request = RepositoryWebAccess.Request(q: "", sort: "", page: nil, order: nil)
		let result = try await dataSource.fetchRepository(request: request)
		#expect(result.totalCount > 0 && result.items.count > 0)
	}
	
	@Test func PullRequestDecoding() async throws {
		let dataSource = MockDataSource()
		let result = try await dataSource.fetchPullRequests(request: PullRequestWebAccess.Request(owner: "", repository: "", state: nil))
		
//		for item in result.items {
//			print("\(item.user.login): \(item.title)")
//		}
		
		#expect(result.items.count > 0)
	}

}
