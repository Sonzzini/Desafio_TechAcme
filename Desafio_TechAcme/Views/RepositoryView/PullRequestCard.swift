//
//  PullRequestCard.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 21/11/24.
//

import SwiftUI

struct PullRequestCard: View {
	
	let pullRequest: PullRequest
	@State var wasTapped: Bool = false
	
	var body: some View {
		Button {
			wasTapped.toggle()
		} label: {
			VStack(alignment: .leading) {
				HStack {
					AsyncImage(url: URL(string: pullRequest.user.avatarURL)) { result in
						result.image?
							.resizable()
							.scaledToFit()
					}
					.frame(width: 35, height: 35)
					.clipShape(Circle())
					
					Text(pullRequest.title)
						.font(.title3)
						.bold()
						.lineLimit(2)
				}
				
				HStack {
					if let closedAt = pullRequest.closedAt {
						Text("\(pullRequest.createdAt, format: .dateTime.day().month().year().hour().minute()) - \(closedAt, format: .dateTime.day().month().year().hour().minute())")
					} else {
						Text("\(pullRequest.createdAt, format: .dateTime.day().month().year().hour().minute())")
					}
				}
				.foregroundStyle(.secondary)
				
				if let body = pullRequest.body {
					Text(body)
						.font(.callout)
						.lineLimit(6)
				}
			}
		}
		.buttonStyle(PlainButtonStyle())
		.sheet(isPresented: $wasTapped) {
			PullRequestWebView(pullRequest: pullRequest)
		}
	}
}

#Preview {
	VStack {
		PullRequestCard(pullRequest:
								PullRequest(user:
													RepositoryOwner(login: "Paulo",
																		 id: 10,
																		 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4"),
												title: "Pull Request titel",
												body: "Este pull request foi muito importante para o projeto",
												createdAt: Date.now,
												closedAt: nil,
												htmlUrl: "https://github.com/vsouza/awesome-ios/pull/3200"))
		
		PullRequestCard(pullRequest:
								PullRequest(user:
													RepositoryOwner(login: "Paulo",
																		 id: 10,
																		 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4"),
												title: "Pull Request titel",
												body: "Este pull request foi muito importante para o projeto",
												createdAt: Date.now,
												closedAt: Date.now,
												htmlUrl: "https://github.com/vsouza/awesome-ios/pull/3200"))
	}
}
