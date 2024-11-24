//
//  RepositoryDataSourceProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol RepositoryDataSourceProtocol {
	func fetchRepository(request: RepositoryWebAccess.Request) async throws -> RepositoryWebAccess.Response
}
