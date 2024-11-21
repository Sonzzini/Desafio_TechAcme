//
//  RepositoryView.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import SwiftUI

struct RepositoryView: View {
	
	@Environment(\.dismiss) private var dismiss
	
	@StateObject var viewModel = Injection.shared.provideRepositoryViewModel()
	
	let repository: Repository
	@State var pullRequestStateRequested: PullRequestStateRequest = .closed
	
	var body: some View {
		NavigationStack {
			
			VStack(alignment: .leading, spacing: 0) {
				HStack {
					Text(repository.fullName)
						.font(.title)
					Spacer()
				}
				
				HStack(spacing: 0) {
					Text("State:")
					Picker("Pull Request State", selection: $pullRequestStateRequested) {
						Text(PullRequestStateRequest.closed.rawValue)
							.tag(PullRequestStateRequest.closed)
						Text(PullRequestStateRequest.open.rawValue)
							.tag(PullRequestStateRequest.open)
					}
				}
				.onChange(of: pullRequestStateRequested) { oldValue, newValue in
					Task {
						try await viewModel.getPullRequests(for: repository.owner.login, with: repository.name, state: newValue)
					}
				}
				Divider()
			}
			.padding(.horizontal)
			.padding(.vertical, 0)
			
			ScrollView {
				if viewModel.isLoading {
					ProgressView {
						Text("Fetching pull requests...")
					}
				}
				
				VStack {
					if let errorMessage = viewModel.errorMessage {
						PullRequestErrorState(errorMessage: errorMessage)
					}
					if viewModel.pullRequests.isEmpty && viewModel.isLoading == false {
						PullRequestsEmptyState()
					} else {
						VStack(alignment: .leading) {
							ForEach(viewModel.pullRequests, id: \.id) { pullRequest in
								PullRequestCard(pullRequest: pullRequest)
								Divider()
							}
						}
					}
				}
			}
			.padding()
			.navigationTitle("Pull Requests")
		
			
		}
		.frame(width: UIScreen.main.bounds.width)
		.background(.secondary.opacity(0.2))
		
		.refreshable {
			Task {
				try await viewModel.getPullRequests(for: repository.owner.login, with: repository.name, state: pullRequestStateRequested)
			}
		}
		
		.onAppear {
			Task {
				try await viewModel.getPullRequests(for: repository.owner.login, with: repository.name, state: pullRequestStateRequested)
			}
		}
		
	}
}

#Preview {
	RepositoryView(repository:
							Repository(id: 1,
										  name: "Self-Talk",
										  fullName: "Sonzzini/Self-Talk",
										  htmlURL: "https://github.com/Sonzzini/Self-Talk",
										  description: "Self talk é um aplicativo que utiliza a tecnologia de RA - Realidade Aumentada - para criar um ambiente virtual onde pacientes podem interagir com personagens e cenários projetados para estimular habilidades de fala e linguagem. É possível ajustar as configurações de cada sessão de terapia para atender às necessidades específicas de cada paciente, variando os níveis de dificuldade e os objetivos terapêuticos. Fonoaudiólogos poderão acompanhar o progresso através de relatórios gerados pelo aplicativo, permitindo ajustes personalizados no plano de tratamento.",
										  stargazersCount: 0,
										  forksCount: 10,
										  language: nil,
										  owner: RepositoryOwner(login: "Sonzzini",
																		 id: 84687052,
																		 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4")))
}

enum PullRequestStateRequest: String {
	case closed = "closed"
	case open = "open"
}
