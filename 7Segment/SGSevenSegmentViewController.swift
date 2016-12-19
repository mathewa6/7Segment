//
//  SGSevenSegmentViewController.swift
//  7Segment
//
//  Created by Adi Mathew on 10/26/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

class SGSevenSegmentViewController: SGSegmentViewController, SGSegmentLogic {

    @IBOutlet var aSegment: SGSegmentView!
    @IBOutlet var bSegment: SGSegmentView!
    @IBOutlet var cSegment: SGSegmentView!
    @IBOutlet var dSegment: SGSegmentView!
    @IBOutlet var eSegment: SGSegmentView!
    @IBOutlet var fSegment: SGSegmentView!
    @IBOutlet var gSegment: SGSegmentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        display(value: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /// Implementation of SGSegmentLogic. Displays 0x0 to 0xF for parameters between 0 to 15.
    /// Displays '-' for invalid input.
    ///
    /// - Parameter value: Must be in [0, 15].
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
