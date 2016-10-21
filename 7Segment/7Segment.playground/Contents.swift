import UIKit


/// UIView subclass to draw one segment in a 7Segment display.
class Segment: UIView {
    
    enum Orientation {
        case horizontal
        case vertical
    }
    
    /// How 'thick' the segment is. This is always the smaller value between length and thickness.
    var thickness: CGFloat = 5.0
    
    /// Length of the segment. It is always the longer value between length and thickness.
    var length: CGFloat = 25.0
    
    /// The side of triangle at each corner that is cutoff to give the 'tip' of the segment. Otherwise it is 1/15th of the length.
    var cutoff: CGFloat = 5.0
    
    /// Indicates whether the segment is "upright": vertical or "sideways": horizontal. This is ONLY to indicate which dimension is longer to help draw the segment.
    var orientation: Orientation
    
    /// The dominant color of each segment. Defaults to red.
    var fillColor: UIColor = UIColor.red
    
    /// The outline color of each segment. Defaults to white.
    var strokeColor: UIColor = UIColor.white
    
    /// The width used to stroke the outline of each segment. It is always thickness/10.
    var strokeWidth: CGFloat = 0.5
    
    override init(frame: CGRect) {
        let h = frame.size.height
        let w = frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        switch orientation {
        case .horizontal:
            length = w
            thickness = h
        case .vertical:
            length = h
            thickness = w
        }
        
        cutoff = length/10
        strokeWidth = thickness/10
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            context?.addLine(to: CGPoint(x: length - offset, y: thickness/2))
            context?.addLine(to: CGPoint(x: length - cutoff, y: thickness - offset))
            context?.addLine(to: CGPoint(x: cutoff, y: thickness - offset))
            context?.addLine(to: CGPoint(x: offset, y: thickness/2))
            
        case .vertical:
            context?.move(to: CGPoint(x: offset, y: cutoff))
            context?.addLine(to: CGPoint(x: offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: thickness/2, y: length - offset))
            context?.addLine(to: CGPoint(x: thickness - offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: thickness - offset, y: cutoff))
            context?.addLine(to: CGPoint(x: thickness/2, y: offset))
        }

        context?.closePath()
        context?.drawPath(using: .fillStroke)
    }
    
    override var description: String {
        return "\(orientation) > (\(thickness), \(length))"
    }
}

let seg = Segment(frame: CGRect.init(x: 0, y: 0, width: 30, height: 150))

let hseg = Segment(frame: CGRect.init(x: 0, y: 0, width: 150, height: 30))


