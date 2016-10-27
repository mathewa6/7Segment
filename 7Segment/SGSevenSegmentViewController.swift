//
//  SGSevenSegmentViewController.swift
//  7Segment
//
//  Created by Adi Mathew on 10/26/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

class SGSevenSegmentViewController: SGSegmentViewController, SGSegmentLogic {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        display(value: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func display(value: Int) {
        if value <= 0 {
            for seg in segments! {
                seg.state = true
            }
        } else {
            for seg in segments! {
                if seg != segments?.first {
                    seg.state = false
                } else {
                    seg.state = true
                }
            }
        }
    }
    
}
