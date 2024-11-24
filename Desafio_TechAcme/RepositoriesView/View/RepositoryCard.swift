//
//  RepositoryCard.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation
import SwiftUI


struct RepositoryCard: View {
	let repository: Repository
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				AsyncImage(url: URL(string: repository.owner.avatarURL)) { result in
					result.image?
						.resizable()
						.scaledToFit()
				}
				.frame(width: 25, height: 25)
				.clipShape(Circle())
				
				Text(repository.owner.login)
					.bold()
					.foregroundStyle(.secondary)
				
				Spacer()
			}
			
			Text(repository.name)
				.font(.title2)
			
			if let repositoryDescription = repository.description {
				Text(repositoryDescription)
					.font(.subheadline)
					.lineLimit(2)
			}
			
			HStack(spacing: 20) {
				StargazersTag(stargazersCount: repository.stargazersCount)
				
				ForksTag(forksCount: repository.forksCount)
				
				if let language = repository.language {
					LanguageTag(language: language)
				}
			}
		}
		.padding()
		
	}
}
