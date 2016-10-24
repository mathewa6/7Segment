//
//  SGSegmentViewController.swift
//  7Segment
//
//  Created by Adi Mathew on 10/23/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

class SGSegmentViewController: UIViewController {

    @IBOutlet var segments: [SGSegmentView]?
    
    
    /// The color to use for segments that are enabled.
    public var color: UIColor {
        didSet {
            for seg in segments! {
                seg.fillColor = color
            }
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.color = UIColor.red
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.color = UIColor.red
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// Use this function to display a hexadecimal value using the segments. Subclasses should override this method to provide the logic for displaying the
    /// correct digit with the segments[] property.
    ///
    /// - parameter value: A hexadecimal value to be displayed on the segment display.
    public func display(value: Int) {
        
    }
}
