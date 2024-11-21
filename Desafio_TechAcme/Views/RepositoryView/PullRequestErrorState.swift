//
//  PullRequestErrorState.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 21/11/24.
//

import SwiftUI

struct PullRequestErrorState: View {
	
	let errorMessage: String
	
	var body: some View {
		Text(errorMessage)
			.multilineTextAlignment(.center)
			.font(.headline)
			.foregroundStyle(.secondary)
		
		Text("The repository might not be public.")
			.multilineTextAlignment(.center)
			.font(.headline)
			.foregroundStyle(.secondary)
			.padding(.bottom, 20)
	}
}

#Preview {
	PullRequestErrorState(errorMessage: "The operation couldn't be completed. (NSURLErrorDomain error -1017.")
}
