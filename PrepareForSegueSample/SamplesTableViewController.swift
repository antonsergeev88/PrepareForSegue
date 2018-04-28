//
//  SamplesTableViewController.swift
//  PrepareForSegueSample
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

import UIKit

class SamplesTableViewController: UITableViewController {

    @objc func prepareForFirstSample() {
        print("PrepareForSegue: \(self.title!) is preparing for first sample. This method was called because it is exported in Objective-C with @objc and named \"prepareFor<SegueIdentifier>()\".")
    }

    @objc func shouldPerformSecondSample() -> Bool {
        print("PrepareForSegue: \(self.title!) is asked if it should perform second sample. This method was called because it is exported in Objective-C with @objc, named \"shouldPerform<SegueIdentifier>()\" and returns Bool.")
        return true
    }

    @objc func shouldPerformThirdSample() -> Bool {
        print("PrepareForSegue: \(self.title!) is asked if it should perform third sample. It returns \"false\", so preparing method will never called.")
        return false
    }

    @objc func prepareForThirdSample() {
        fatalError("Will never called")
    }

}
