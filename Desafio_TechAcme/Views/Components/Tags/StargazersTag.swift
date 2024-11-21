//
//  StargazersTag.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import SwiftUI

struct StargazersTag: View {
	
	let stargazersCount: Int
	
	var body: some View {
		HStack(spacing: 5) {
			Image(systemName: "star")
			
			Text("\(stargazersCount)")
		}
		.foregroundStyle(.secondary)
	}
}

#Preview {
	VStack {
		StargazersTag(stargazersCount: 1)
		StargazersTag(stargazersCount: 0)
		StargazersTag(stargazersCount: 3)
		StargazersTag(stargazersCount: 30)
	}
}
