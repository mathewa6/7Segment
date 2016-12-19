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
        display(value: 1)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        let v = UInt8(value)
        print(String(v << 4, radix: 2).pad(with: "0", length: 4))
        
        // Turn off all segments to prepare for new value.
        _ = segments?.map({
            $0.state = false
        })
        
        // If new value is invalid then only g is set.
        if value < 0 || value >= 16 {
            gSegment.state = true
        } else {
            bSegment.state = true
            cSegment.state = true
        }
    }
    
}

// Idea from http://stackoverflow.com/questions/26181221/how-to-convert-a-decimal-number-to-binary-in-swift
extension String {
    func pad(with char: String, length: Int) -> String {
        let diff = length - self.characters.count
        guard diff > 0 else {
            return self // self.substring(from: self.index(self.startIndex, offsetBy: abs(diff)))
        }
        
        return String(repeating: char, count: diff) + self
    }
}
