//
//  languageTag.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import SwiftUI

struct LanguageTag: View {
	
	let language: String
	
	var body: some View {
		HStack(spacing: 5) {
			Circle()
				.fill(Color("\(language)Color"))
				.frame(width: 15)
				.fixedSize()
				
			Text(language)
				.foregroundStyle(.secondary)
		}
	}
}

#Preview {
	VStack {
		LanguageTag(language: "Swift")
		LanguageTag(language: "C")
		LanguageTag(language: "C++")
		LanguageTag(language: "Python")
		LanguageTag(language: "Java")
	}
}
