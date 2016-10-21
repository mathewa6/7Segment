import UIKit


/// UIView subclass to draw one segment in a 7Segment display.
class Segment: UIView {
    
    enum Orientation {
        case horizontal
        case vertical
    }
    
    var thickness: CGFloat = 5.0
    var length: CGFloat = 25.0
    var orientation: Orientation
    var color: UIColor = UIColor.red
    
    override init(frame: CGRect) {
        let h = frame.size.height
        let w = frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        length = h
        thickness = w
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let segmentRect = CGRect.init(x: 0, y: 0, width: thickness, height: length)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.setStrokeColor(color.cgColor)
        context?.fill(segmentRect)
    }
    
    override var description: String {
        return "\(orientation) > (\(thickness), \(length))"
    }
}

let seg = Segment(frame: CGRect.init(x: 0, y: 0, width: 50, height: 150))