//
//  ViewController.swift
//  SkillBoxTask12
//
//  Created by Илья Лобков on 20/09/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segmentView: SegmentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
}
extension ViewController : SegmentViewDelegate {
      func pressOneSegmentOne(_ delegate: SegmentView) {
        print("Выбран 1 сегмент")
      }
      
      func pressOneSegmentTwo(_ delegate: SegmentView) {
        print("Выбран 2 сегмент")
      }
  }
