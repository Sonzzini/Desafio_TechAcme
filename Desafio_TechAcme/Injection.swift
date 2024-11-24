//
//  Injection.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

struct Injection {
	static let shared = Injection()
	
	private init() {}
	
	func provideRepositoryViewModel() -> RepositoryViewModel {
		let dataSource = RepositoryRemoteDataSource()
		let repository = RepositoryRepositoryImpl(remoteDataSource: dataSource)
		let useCase = RepositoryUseCaseImpl(repository: repository)
		return RepositoryViewModel(repositoryUseCase: useCase)
	}
	func provideMockRepositoryViewModel() -> RepositoryViewModel {
		let dataSource = MockDataSource()
		let repository = RepositoryRepositoryImpl(remoteDataSource: dataSource)
		let useCase = RepositoryUseCaseImpl(repository: repository)
		return RepositoryViewModel(repositoryUseCase: useCase)
	}
	
	
	func providePullRequestViewModel() -> PullRequestViewModel {
		let dataSource = PullRequestRemoteDataSource()
		let repository = PullRequestRepositoryImpl(remoteDataSource: dataSource)
		let useCase = PullRequestUseCaseImpl(repository: repository)
		return PullRequestViewModel(pullRequestUseCase: useCase)
	}
	func provideMockPullRequestViewmodel() -> PullRequestViewModel {
		let dataSource = MockDataSource()
		let repository = PullRequestRepositoryImpl(remoteDataSource: dataSource)
		let useCase = PullRequestUseCaseImpl(repository: repository)
		return PullRequestViewModel(pullRequestUseCase: useCase)
	}
	
}

