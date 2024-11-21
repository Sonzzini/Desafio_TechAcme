//
//  HomeViewModel.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

class HomeViewModel: ObservableObject {
	
	@Published var repositories: [Repository] = []
	@Published var isLoading: Bool = false
	@Published var errorMessage: String?
	
	let homeUseCase: HomeUseCaseProtocol
	
	init(homeUseCase: HomeUseCaseProtocol) {
		self.homeUseCase = homeUseCase
	}
	
	func getRepositories() async throws {
		self.isLoading = true
		
		let result = try await homeUseCase.execute()
		
		switch result {
		case .success(let repositories):
			self.repositories = repositories
			self.isLoading = false
		case .failure(let error):
			self.errorMessage = "Could not get repositories: \(error.localizedDescription)"
			self.isLoading = false
			print("Error fetching repositories: \(error.localizedDescription)")
		}
	}
}
