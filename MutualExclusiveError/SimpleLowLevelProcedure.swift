//
//  SimpleLowLevelProcedure.swift
//  MutualExclusiveError
//
//  Created by Yannick Heinrich on 23.08.17.
//  Copyright © 2017 Yageek. All rights reserved.
//

import ProcedureKit

final class SimpleLowLevelProcedure: Procedure, OutputProcedure {

    var output: Pending<ProcedureResult<Int>> = .pending
    override init() {
        super.init()
        name = "SimpleLowLevelProcedure"

        // Comment to solve the issue
        add(condition: MutuallyExclusive<SimpleLowLevelProcedure>())

    }

    override func execute() {
        guard !isCancelled else { finish(); return}
        self.finish(withResult: .success(10))
    }
}
