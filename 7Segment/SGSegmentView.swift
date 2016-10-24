//
//  SGView.swift
//  7Segment
//
//  Created by Adi Mathew on 10/21/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

@IBDesignable
/// UIView subclass to draw one segment in a 7Segment display.
class SGSegmentView: UIView {
    
    enum Orientation {
        case horizontal
        case vertical
        case null
    }
    
    /// The dominant color of each segment. Defaults to red.
    @IBInspectable var fillColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The outline color of each segment. Defaults to white.
    @IBInspectable var strokeColor: UIColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func layoutSubviews() {
        let h = self.frame.size.height
        let w = self.frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        switch orientation {
        case .horizontal:
            length = w
            breadth = h
        case .vertical:
            length = h
            breadth = w
        default:
            length = w
            breadth = h
        }
        setNeedsDisplay()
    }
    
    /**
     Used to set and check the state of a segment.
     
     **true** = on      ( fillColor = fillColor )
     
     **false** = off    ( fillColor = strokeColor )
    */
    public var state: Bool = true {
        didSet {
            self.fillColor = state ? self.fillColor : self.strokeColor
        }
    }
    
    /// How 'thick' the segment is. This is always the smaller value between length and breadth.
    private var breadth: CGFloat = 5.0
    
    /// Length of the segment. It is always the longer value between length and breadth.
    private var length: CGFloat = 25.0
    
    /// The side of triangle at each corner that is cutoff to give the 'tip' of the segment. Otherwise it is half the breadth. This is done to keep the slope of each angled section of the segment equal to 1(see drawRect()), thereby allowing us to align neighboring segments.
    private var cutoff: CGFloat { return breadth/2 }
    
    /// The width used to stroke the outline of each segment. It is always breadth/10.
    private var strokeWidth: CGFloat { return breadth/10 }
    
    /// Indicates whether the segment is "upright": vertical or "sideways": horizontal. This is ONLY to indicate which dimension is longer to help draw the segment.
    private var orientation: Orientation
    
    override init(frame: CGRect) {
        let h = frame.size.height
        let w = frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        switch orientation {
        case .horizontal:
            length = w
            breadth = h
        case .vertical:
            length = h
            breadth = w
        default:
            length = w
            breadth = h
        }
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        orientation = .null
        
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        // Set up the stroke/fill color and stroke width.
        context?.setStrokeColor(strokeColor.cgColor)
        context?.setLineWidth(strokeWidth)
        context?.setFillColor(fillColor.cgColor)
        
        // Create an offset to account for the stroke thickness and prevent drawing outside the rect.
        let offset = strokeWidth/2
        
        switch orientation {
        case .horizontal:
            context?.move(to: CGPoint(x: cutoff, y: offset))
            context?.addLine(to: CGPoint(x: length - cutoff, y: offset))
            context?.addLine(to: CGPoint(x: length - offset, y: breadth/2))
            context?.addLine(to: CGPoint(x: length - cutoff, y: breadth - offset))
            context?.addLine(to: CGPoint(x: cutoff, y: breadth - offset))
            context?.addLine(to: CGPoint(x: offset, y: breadth/2))
            
        case .vertical:
            context?.move(to: CGPoint(x: offset, y: cutoff))
            context?.addLine(to: CGPoint(x: offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: breadth/2, y: length - offset))
            context?.addLine(to: CGPoint(x: breadth - offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: breadth - offset, y: cutoff))
            context?.addLine(to: CGPoint(x: breadth/2, y: offset))
            
        default:
            break
        }
        
        context?.closePath()
        context?.drawPath(using: .fillStroke)
    }
    
    override var description: String {
        return "\(orientation) > (\(breadth), \(length))"
    }
}
