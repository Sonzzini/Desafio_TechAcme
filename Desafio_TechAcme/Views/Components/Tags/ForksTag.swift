//
//  ForksTag.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import SwiftUI

struct ForksTag: View {
	
	let forksCount: Int
	
	var body: some View {
		HStack(spacing: 5) {
			Image(systemName: "arrow.triangle.branch")
			
			Text("\(forksCount)")
		}
		.foregroundStyle(.secondary)
	}
}

#Preview {
	VStack {
		ForksTag(forksCount: 3)
		ForksTag(forksCount: 0)
		ForksTag(forksCount: 30)
		ForksTag(forksCount: 2)
	}
}
