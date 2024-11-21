//
//  PullRequestsEmptyState.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 21/11/24.
//

import SwiftUI

struct PullRequestsEmptyState: View {
	var body: some View {
		VStack {
			Text("No Pull Requests Found")
							
			Text("Drag down to refresh")
				.padding(.bottom)
			
			Image(systemName: "arrow.down")
				.font(.title)
		}
		.font(.headline)
		.foregroundColor(.secondary)
	}
}

#Preview {
	PullRequestsEmptyState()
}
