//
//  CoordinatorDependencyDefaultManagerTests.swift
//  Coordinator
//
//  Created by Nikita Lazarev-Zubov on 19.4.2020.
//

// TODO: Tests

@testable
import Coordinator
import XCTest

final class CoordinatorDependencyDefaultManagerTests: XCTestCase {

    // MARK: - Properties

    static private(set) var allTests = [("testSuccessfulAdd", testSuccessfulAdd),
                                        ("testUnsuccessfulAdd", testUnsuccessfulAdd),
                                        ("testSuccessfulRemove", testSuccessfulRemove),
                                        ("testUnsuccessfultRemove", testUnsuccessfultRemove)]

    // MARK: - Methods

    func testSuccessfulAdd() {
        let manager = CoordinatorDependencyDefaultManager()
        let coordinator = MockCoordinator()

        XCTAssertTrue(manager.add(dependency: coordinator),
                      "Coordinator wasn't added by the dependencies' manager neither it had't been added before.")
    }

    func testUnsuccessfulAdd() {
        let manager = CoordinatorDependencyDefaultManager()
        let coordinator = MockCoordinator()

        XCTAssertTrue(manager.add(dependency: coordinator),
                      "Coordinator wasn't added by the dependencies' manager neither it had't been added before.")
        XCTAssertFalse(manager.add(dependency: coordinator),
                       "Coordinator was added by the dependencies' manager twice.")
    }

    func testSuccessfulRemove() {
        let manager = CoordinatorDependencyDefaultManager()

        let coordinator = MockCoordinator()
        manager.add(dependency: coordinator)

        XCTAssertTrue(manager.remove(dependency: coordinator),
                      "Coordinator wasn't removed by the dependencies' manager although it had been added previously.")
    }

    func testUnsuccessfultRemove() {
        let manager = CoordinatorDependencyDefaultManager()

        let coordinator = MockCoordinator()
        manager.add(dependency: coordinator)

        XCTAssertTrue(manager.remove(dependency: coordinator),
                      "Coordinator wasn't removed by the dependencies' manager although it had been added previously.")
        XCTAssertFalse(manager.remove(dependency: coordinator),
                       "Coordinator was removed by the dependencies' manager twice which is claimed to be impossible.")
    }

}

// MARK: -

private final class MockCoordinator: Coordinator {

    // MARK: - Methods

    // MARK: Coordinator protocol methods

    func start() {
        // Do nothing.
    }

}
