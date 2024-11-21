//
//  ContentView.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject var viewModel = Injection.shared.provideHomeViewModel()
	
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
							RepositoryView(repository: repository)
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
			viewModel.errorMessage = nil
			Task {
				try await viewModel.getRepositories()
			}
		}
		.onAppear {
			Task {
				try await viewModel.getRepositories()
			}
		}

	}
}

#Preview {
	HomeView()
}


extension HomeView {
	private var topViewAnchor: some View {
		Color.clear.opacity(0)
			.id(Self.topId)
	}
}
