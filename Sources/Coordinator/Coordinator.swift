//
//  CoordinatorDependencyManager.swift
//  Coordinator
//
//  Created by Nikita Lazarev-Zubov on 19.4.2020.
//

/// Handles navigation events of a specific part of the application
public protocol Coordinator: class {

    // MARK: - Methods

    /// Starts the flow of a part of application.
    func start()

}
