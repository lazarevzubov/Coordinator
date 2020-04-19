//
//  CoordinatorFlowListener.swift
//  Coordinator
//
//  Created by Nikita Lazarev-Zubov on 19.4.2020.
//

/// Provides interface for letting know parent coordinators that their child coordinators finished their flow and can be released.
public protocol CoordinatorFlowListener {

    // MARK: - Methods

    /**
     Signals that a child coordinator finished its flow.
     - Parameter coordinator: A child coordinator that finished its flow.
     */
    func flowFinished(_ coordinator: Coordinator)

}
