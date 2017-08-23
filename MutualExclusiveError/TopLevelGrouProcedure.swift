//
//  TopLevelGrouProcedure.swift
//  MutualExclusiveError
//
//  Created by Yannick Heinrich on 23.08.17.
//  Copyright © 2017 Yageek. All rights reserved.
//

import ProcedureKit

final class TopLevelGroup: GroupProcedure, OutputProcedure {
 var output: Pending<ProcedureResult<Int>> = .pending
    init() {
        super.init(operations: [])
        name = "TopLevelGroup"

        let op = SimpleLowLevelProcedure()
        add(children: [op])
    }


    override func child(_ child: Procedure, willFinishWithErrors errors: [Error]) {
        super.child(child, willFinishWithErrors: errors)

        if let op = child as? SimpleLowLevelProcedure {
            output = op.output
        }
    }
}
