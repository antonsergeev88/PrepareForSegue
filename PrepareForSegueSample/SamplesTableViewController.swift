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

    @objc func prepareForSecondSample() {
        fatalError("Will be never called")
    }

    @objc func prepareForSecondSample(sender: Any?) {
        print("PrepareForSegue: \(self.title!) is preparing for second sample. This method was called because it is exported in Objective-C with @objc and named \"prepareFor<SegueIdentifier>(sender: Any?)\". This method has \"sender\" parameter and has higher priority than method without one.")
    }

    @objc func shouldPerformThirdSample() -> Bool {
        print("PrepareForSegue: \(self.title!) is asked if it should perform third sample. This method was called because it is exported in Objective-C with @objc, named \"shouldPerform<SegueIdentifier>()\" and returns Bool.")
        return true
    }

    @objc func prepareForThirdSample() {
        print("PrepareForSegue: \(self.title!) is preparing for third sample.")
    }

    @objc func shouldPerformFourthSample() -> Bool {
        print("PrepareForSegue: \(self.title!) is asked if it should perform fourth sample. It returns \"false\", so preparing method will be never called.")
        return false
    }

    @objc func prepareForFourthSample() {
        fatalError("Will be never called")
    }

    @objc func shouldPerformFifthSample() -> Bool {
        fatalError("Will be never called")
    }

    @objc func shouldPerformFifthSample(sender: Any?) -> Bool {
        print("PrepareForSegue: \(self.title!) is asked if it should perform fifth sample. This method was called because it is exported in Objective-C with @objc, named \"shouldPerform<SegueIdentifier>(sender: Any?)\" and returns Bool. This method has \"sender\" parameter and has higher priority than method without one.")
        return true
    }

}
