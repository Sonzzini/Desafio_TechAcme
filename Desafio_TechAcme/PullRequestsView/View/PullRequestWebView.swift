//
//  PullRequestWebView.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 21/11/24.
//

import SwiftUI
import WebKit

struct PullRequestWebView: View {
	
	let pullRequest: PullRequest
	
	fileprivate struct WebView: UIViewRepresentable {
		
		let webView: WKWebView
		let url: URL
		
		init(url: URL) {
			webView = WKWebView(frame: .zero)
			self.url = url
		}
		
		func makeUIView(context: Context) -> WKWebView {
			return webView
		}
		func updateUIView(_ uiView: WKWebView, context: Context) {
			webView.load(URLRequest(url: url))
		}
	}
	
	var body: some View {
		VStack {
			if let url = URL(string: pullRequest.htmlUrl) {
				WebView(url: url)
			} else {
				Text("Pull Request page URL not found")
			}
		}
	}
}

#Preview {
	PullRequestWebView(pullRequest:
								PullRequest(user:
													RepositoryOwner(login: "Paulo",
																		 id: 10,
																		 avatarURL: "https://avatars.githubusercontent.com/u/84687052?v=4"),
												title: "Pull Request titel",
												body: "Este pull request foi muito importante para o projeto",
												createdAt: Date.now,
												closedAt: nil,
												htmlUrl: "https://github.com/vsouza/awesome-ios/pull/3200"))
}
