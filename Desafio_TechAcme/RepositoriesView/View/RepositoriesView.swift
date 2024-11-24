//
//  ContentView.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import SwiftUI

struct RepositoriesView: View {
	
	@StateObject var viewModel = Injection.shared.provideRepositoryViewModel()
	
	private static let topId = "topId"
	
	var body: some View {
		NavigationStack {
			ScrollViewReader { reader in
				ScrollView {
					topViewAnchor
					
					if viewModel.isLoading {
						ProgressView()
					}
					
					if let error = viewModel.errorMessage {
						Text("\(error)")
					}
					
					ForEach(viewModel.repositories, id:\.htmlURL) { repository in
						Divider()
						NavigationLink {
							PullRequestsView(repository: repository)
						} label: {
							RepositoryCard(repository: repository)
						}
						.buttonStyle(PlainButtonStyle())
					}
					
				}
				.background(.secondary.opacity(0.2))
				
				.navigationBarTitle("Repositories")
				
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button {
							withAnimation(.easeInOut(duration: 0.4)) {
								reader.scrollTo(Self.topId, anchor: .top)
							}
						} label: {
							Image(systemName: "arrow.uturn.up.circle")
						}
					}
				}
				
			}
		}
		.refreshable {
			let request = RepositoryWebAccess.Request(q: "language:Swift",
																	sort: "stars",
																	page: 1,
																	order: nil)
			Task {
				try await viewModel.getRepositories(request: request)
			}
		}
		.onAppear {
			let request = RepositoryWebAccess.Request(q: "language:Swift",
																	sort: "stars",
																	page: 1,
																	order: nil)
			Task {
				try await viewModel.getRepositories(request: request)
			}
		}

	}
}

#Preview {
	RepositoriesView()
}


extension RepositoriesView {
	private var topViewAnchor: some View {
		Color.clear.opacity(0)
			.id(Self.topId)
	}
}
