//
//  HomeViewModel.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

class RepositoryViewModel: ObservableObject {
	
	@Published var repositories: [Repository] = []
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	
	let repositoryUseCase: RepositoryUseCaseProtocol
	
	init(repositoryUseCase: RepositoryUseCaseProtocol) {
		self.repositoryUseCase = repositoryUseCase
	}
	
	func getRepositories(request: RepositoryWebAccess.Request) async throws {
		DispatchQueue.main.async {
			self.errorMessage = nil
			self.isLoading = true
		}
		
		let result = try await repositoryUseCase.execute(request: request)
		
		switch result {
		case .success(let repositories):
			DispatchQueue.main.async {
				self.repositories = repositories
				self.isLoading = false
			}
		case .failure(let error):
			DispatchQueue.main.async {
				self.errorMessage = "Could not get repositories: \(error.localizedDescription)"
				self.isLoading = false
			}
			print("Error fetching repositories: \(error.localizedDescription)")
		}
	}
}
