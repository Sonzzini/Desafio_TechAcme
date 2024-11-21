//
//  MockDataSource.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct MockDataSource: DataSourceProtocol {
	
	func fetchRepository() async throws -> RepositoryResponse {
		return RepositoryResponse(totalCount: 3,
										  incompleteResults: false,
										  items: [
											Repository(id: 1,
														  name: "Self-Talk",
														  fullName: "Sonzzini/Self-Talk",
														  htmlURL: "https://github.com/Sonzzini/Self-Talk",
														  description: "Self talk é um aplicativo que utiliza a tecnologia de RA - Realidade Aumentada - para criar um ambiente virtual onde pacientes podem interagir com personagens e cenários projetados para estimular habilidades de fala e linguagem. É possível ajustar as configurações de cada sessão de terapia para atender às necessidades específicas de cada paciente, variando os níveis de dificuldade e os objetivos terapêuticos. Fonoaudiólogos poderão acompanhar o progresso através de relatórios gerados pelo aplicativo, permitindo ajustes personalizados no plano de tratamento.",
														  stargazersCount: 0,
														  forksCount: 0,
														  language: nil,
														  owner: RepositoryOwner(login: "Sonzzini",
																						 id: 84687052,
																						 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4")),
											Repository(id: 2,
														  name: "Sinale",
														  fullName: "Sonzzini/Sinale",
														  htmlURL: "https://github.com/Sonzzini/Sinale",
														  description: nil,
														  stargazersCount: 1,
														  forksCount: 10,
														  language: "Portuguese",
														  owner: RepositoryOwner(login: "Sonzzini",
																						 id: 84687052,
																						 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4")),
											Repository(id: 3,
														  name: "CloudKitSample",
														  fullName: "Sonzzini/CloudKitSample-with-PDF-support",
														  htmlURL: "https://github.com/Sonzzini/CloudKitSample-with-PDF-support",
														  description: nil,
														  stargazersCount: 3,
														  forksCount: 35,
														  language: nil,
														  owner: RepositoryOwner(login: "Sonzzini",
																						 id: 84687052,
																						 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4"))
										  ])
	}
	
	func fetchPullRequests(owner: String, repo: String, state: PullRequestStateRequest) async throws -> PullRequestResponse {
		guard let url = Bundle.main.url(forResource: "MockPullRequestAPIResponse", withExtension: "json") else { throw URLError(.fileDoesNotExist) }
		
		let data = try Data(contentsOf: url)
		
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		
		return try decoder.decode(PullRequestResponse.self, from: data)
	}
	
}
