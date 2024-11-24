//
//  PullRequestViewModel.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

class PullRequestViewModel: ObservableObject {
	
	@Published var pullRequests: [PullRequest] = []
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	
	let pullRequestUseCase: PullRequestUseCaseProtocol
	
	init(pullRequestUseCase: PullRequestUseCaseProtocol) {
		self.pullRequestUseCase = pullRequestUseCase
	}
	
	func getPullRequests(request: PullRequestWebAccess.Request) async throws {
		DispatchQueue.main.async {
			self.errorMessage = nil
			self.pullRequests = []
			
			self.isLoading = true
		}
		
		let result = try await pullRequestUseCase.execute(request: request)
		
		switch result {
		case .success(let pullRequests):
			DispatchQueue.main.async {
				self.pullRequests = pullRequests
				self.isLoading = false
			}
		case .failure(let error):
			DispatchQueue.main.async {
				self.errorMessage = "Could not get pull requests: \(error.localizedDescription)"
				self.isLoading = false
			}
			print("Error fetching pull requests: \(error.localizedDescription)")
		}
	}
}
