//
//  CoordinatorDependencyManager.swift
//  Coordinator
//
//  Created by Nikita Lazarev-Zubov on 19.4.2020.
//

// TODO: HeaderDoc

public protocol CoordinatorDependencyManager {

    // MARK: - Methods

    @discardableResult
    func add(dependency childCoorinator: Coordinator) -> Bool
    @discardableResult
    func remove(dependency childCoordinator: Coordinator) -> Bool

}

// MARK: -

public final class CoordinatorDependencyDefaultManager: CoordinatorDependencyManager {

    // MARK: - Properties

    // MARK: Private properties

    private lazy var dependencies = [Coordinator]()

    // MARK: - Methods

    @discardableResult
    public func add(dependency childCoorinator: Coordinator) -> Bool {
        guard !dependencies.contains(where: { $0 === childCoorinator }) else {
            return false
        }

        dependencies.append(childCoorinator)
        return true
    }

    @discardableResult
    public func remove(dependency childCoordinator: Coordinator) -> Bool {
        let prevCount = dependencies.count
        dependencies.removeAll { $0 === childCoordinator }

        return dependencies.count < prevCount
    }

}
