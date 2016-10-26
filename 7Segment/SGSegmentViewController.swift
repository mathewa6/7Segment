//
//  SGSegmentViewController.swift
//  7Segment
//
//  Created by Adi Mathew on 10/23/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

class SGSegmentViewController: UIViewController, SGSegmentLogic {

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
        self.display(value: 1)
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
