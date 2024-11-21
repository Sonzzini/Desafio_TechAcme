//
//  RepositoryViewModel.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

class RepositoryViewModel: ObservableObject {
	
	@Published var pullRequests: [PullRequest] = []
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	
	let repoUseCase: RepositoryUseCaseProtocol
	
	init(repoUseCase: RepositoryUseCaseProtocol) {
		self.repoUseCase = repoUseCase
	}
	
	func getPullRequests(for owner: String, with repository: String, state: PullRequestStateRequest) async throws {
		self.errorMessage = nil
		self.pullRequests = []
		
		self.isLoading = true
		
		let result = try await repoUseCase.execute(for: owner, with: repository, state: state)
		
		switch result {
		case .success(let pullRequests):
			self.pullRequests = pullRequests
			self.isLoading = false
		case .failure(let error):
			self.errorMessage = "Could not get pull requests: \(error.localizedDescription)"
			self.isLoading = false
			print("Error fetching pull requests: \(error.localizedDescription)")
		}
	}
}
