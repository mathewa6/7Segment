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
        let mask4 = (UInt8(1) << 4) - 1 // 1 << 4 is just 2^4. Subtracting 1 gives us a mask of length 4.
        print("INPUT: ", String(v & mask4, radix: 2).pad(with: "0", length: 8))
        
        let l1 = (v.pos8()) >> 3
        let l2 = (v.pos4()) >> 2
        let l3 = (v.pos2()) >> 1
        let l4 = (v.pos1()) >> 0
        
        let l1Not = (~l1).pos1()
        let l2Not = (~l2).pos1()
        let l3Not = (~l3).pos1()
        let l4Not = (~l4).pos1()
        
        let aState = (l2Not & l4Not) | (l1Not & l3) | (l1Not & l2 & l4) | (l2 & l3) | (l1 & l3Not & l4Not) | (l1 & l2Not & l3Not)
        let bState = (l1Not & l3Not & l4Not) | (l2Not & l4Not) | (l1Not & l2Not) | (l1Not & l3 & l4) | (l1 & l3Not & l4) | (l1 & l2Not & l3Not)
        let cState = (l1Not & l3Not) | (l1Not & l2Not & l4) | (l1Not & l2) | (l1 & l3Not & l4) | (l1 & l2Not)
        let dState = (l2Not & l3Not & l4Not) | (l1Not & l2Not & l3) | (l1Not & l3 & l4Not) | (l2 & l3 & l4Not) | (l2 & l3Not & l4) | (l1 & l3Not) | (l1 & l2Not & l4)
        let eState = (l2Not & l4Not) | (l1Not & l3 & l4Not) | (l1 & l2) | (l1 & l3) | (l1 & l3Not & l4Not)
        let fState = (l3Not & l4Not) | (l1Not & l2 & l3Not) | (l2 & l3 & l4Not) | (l1 & l3) | (l1 & l2Not)
        let gState = (l1Not & l2Not & l3) | (l1Not & l2 & l3Not) | (l2 & l3Not & l4) | (l2 & l3 & l4Not) | (l1 & l2Not) | (l1 & l3 & l4)
        
        
        // Turn off all segments to prepare for new value.
        _ = segments?.map({
            $0.state = false
        })
        
        // If new value is invalid then only g is set.
        if value < 0 || value >= 16 {
            fSegment.state = true
        } else {
            aSegment.state = aState > 0
            bSegment.state = bState > 0
            cSegment.state = cState > 0
            dSegment.state = dState > 0
            eSegment.state = eState > 0
            fSegment.state = fState > 0
            gSegment.state = gState > 0
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

extension UInt8 {
    func binaryDescription() -> String {
        return String(self, radix: 2).pad(with: "0", length: 8)
    }
    
    func pos8() -> UInt8 {
        return (UInt8(1) << 3) & self
    }
    
    func pos4() -> UInt8 {
        return (UInt8(1) << 2) & self
    }
    
    func pos2() -> UInt8 {
        return (UInt8(1) << 1) & self
    }
    
    func pos1() -> UInt8 {
        return (UInt8(1) << 0) & self
    }
}
