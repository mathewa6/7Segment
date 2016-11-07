//
//  File.swift
//  7Segment
//
//  Created by Adi Mathew on 10/26/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

protocol SGSegmentLogic {
    
    /// Use this function to display a hexadecimal value using the segments. Subclasses of SGSegmentVC should implement this method to provide the
    /// logic for displaying the correct digit with the segments[] property.
    ///
    /// - parameter value: A hexadecimal value to be displayed on the segment display.
    func display(value: Int)
    
}
