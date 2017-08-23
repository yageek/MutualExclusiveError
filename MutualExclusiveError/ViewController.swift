//
//  ViewController.swift
//  MutualExclusiveError
//
//  Created by Yannick Heinrich on 23.08.17.
//  Copyright © 2017 Yageek. All rights reserved.
//

import UIKit
import ProcedureKit



class ViewController: UIViewController {
    @IBOutlet weak var button: UIBarButtonItem!
    let queue = ProcedureQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionTriggered(_ sender: UIBarButtonItem) {

        sender.isEnabled = false
        someAsyncTask {
            DispatchQueue.main.async {
                sender.isEnabled = true
            }
        }
    }
    
    func someAsyncTask(block: @escaping () -> Void) {
        let op1 = TopLevelGroup()
        let op2 = TopLevelGroup()

        op2.add(dependency: op1)

        let reduceOp = [op1, op2].reduce(0) { $0 + $1 }

        reduceOp.addDidFinishBlockObserver { (_, _) in
            block()
        }

        queue.add(operations: reduceOp, op1, op2)
    }

}

