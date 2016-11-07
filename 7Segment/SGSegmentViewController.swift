//
//  SGSegmentViewController.swift
//  7Segment
//
//  Created by Adi Mathew on 10/23/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

/// This is an abstract superclass that holds properties like segments and color. To implement logic about which segments to turn on/off, you have to conform to the SGSegmentLogic protocol. For segments in a subclass' .xib, you need to select all segments in Interface Builder and control+drag to the File's Owner.
/// - note: Subclass this and implement SGSegmentLogic for 7, 9, 14 and 16 segment displays.
class SGSegmentViewController: UIViewController {

    @IBOutlet public var segments: [SGSegmentView]?
    
    
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
    
}
