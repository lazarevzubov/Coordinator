//
//  CoordinatorDependencyManager.swift
//  Coordinator
//
//  Created by Nikita Lazarev-Zubov on 19.4.2020.
//

/**
 Manages the retain-release cycle of a coordinator.

 Coordinators typically create other, child, coordinators. Dependency manager can be injected into a parent coordinator
 to store links to that child coordinators. That will help to controll the lifecycle of coordinator objects,
 that is they won't be released prematurely.
 */
public protocol CoordinatorDependencyManager {

    // MARK: - Methods

    /**
     Adds a coordinator to the list of stored dependencies.
     - Parameter childCoordinator: A coordinator to add as a dependant.
     - Returns: `true` if the coordinator was successfully added as a dependant,
     or `false` if it was already stored in the list.
     */
    @discardableResult
    func add(dependency childCoordinator: Coordinator) -> Bool
    /**
    Removes a coordinator from the list of stored dependencies.
    - Parameter childCoordinator: A coordinator to remove from the dependants list.
    - Returns: `true` if the coordinator was successfully removed from the list, or `false` if it wasn't there.
    */
    @discardableResult
    func remove(dependency childCoordinator: Coordinator) -> Bool

}

// MARK: -

/**
 The default implementation of the manager.

 Relies internally on the array of objects and thus, methods have linear (O(n)) time complexity.
 */
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
