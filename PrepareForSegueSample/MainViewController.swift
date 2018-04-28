//
//  MainViewController.swift
//  PrepareForSegueSample
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @objc func shouldPerformEmbeddingMainView() -> Bool {
    print("PrepareForSegue: \(self.title!) is asked if it should perform embedding main view.")
    return true;
  }

  @objc func prepareForEmbeddingMainView() {
    print("PrepareForSegue: \(self.title!) is preparing for embedding main view.")
  }

}
