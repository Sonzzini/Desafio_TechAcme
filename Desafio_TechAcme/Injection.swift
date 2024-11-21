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
	
	func provideHomeViewModel() -> HomeViewModel {
		let dataSource = RemoteDataSource()
		let repository = ReposRepositoryImpl(remoteDataSource: dataSource)
		let useCase = HomeUseCaseImpl(repository: repository)
		return HomeViewModel(homeUseCase: useCase)
	}
	
	func provideMockHomeViewModel() -> HomeViewModel {
		let dataSource = MockDataSource()
		let repository = ReposRepositoryImpl(remoteDataSource: dataSource)
		let useCase = HomeUseCaseImpl(repository: repository)
		return HomeViewModel(homeUseCase: useCase)
	}
	
	func provideRepositoryViewModel() -> RepositoryViewModel {
		let dataSource = RemoteDataSource()
		let repository = ReposRepositoryImpl(remoteDataSource: dataSource)
		let useCase = RepositoryUseCaseImpl(repository: repository)
		return RepositoryViewModel(repoUseCase: useCase)
	}
}

