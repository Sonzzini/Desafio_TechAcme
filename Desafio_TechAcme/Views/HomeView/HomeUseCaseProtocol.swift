//
//  HomeUseCaseProtocol.swift
//  Desafio_TechAcme
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 18/11/24.
//

import Foundation

protocol HomeUseCaseProtocol {
	func execute() async throws -> Result<[Repository], any Error>
}
