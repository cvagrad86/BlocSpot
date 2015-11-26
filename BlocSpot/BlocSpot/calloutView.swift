//
//  calloutView.swift
//  BlocSpot
//
//  Created by Eric Chamberlin on 11/26/15.
//  Copyright © 2015 Eric Chamberlin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class BubbleView: UIView {
    
    @IBInspectable public var cornerRadius      : CGFloat = 5
    @IBInspectable public var arrowHeight       : CGFloat = 20
    @IBInspectable public var arrowAngle        : CGFloat = CGFloat(M_PI_4)
    @IBInspectable public var bubbleFillColor   : UIColor = UIColor.redColor()
    @IBInspectable public var bubbleStrokeColor : UIColor = UIColor.whiteColor()
    @IBInspectable public var bubbleLineWidth   : CGFloat = 1
    
    public let contentView = UIView()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    private func configure() {
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        addSubview(contentView)
    }
    
    override public func layoutSubviews() {
        let contentViewFrame = CGRect(x: cornerRadius, y: cornerRadius, width: frame.size.width - cornerRadius * 2.0, height: frame.size.height - cornerRadius * 2.0 - arrowHeight)
        
        contentView.frame = contentViewFrame
    }
    
    public func setContentViewSize(size: CGSize) {
        var bubbleFrame = self.frame
        bubbleFrame.size = CGSize(width: size.width + cornerRadius * 2.0, height: size.height + cornerRadius * 2.0 + arrowHeight)
        frame = bubbleFrame
        setNeedsDisplay()
    }
    
    // draw the callout/popover/bubble with rounded corners and an arrow pointing down (presumably to the item below this)
    
    override public func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        let start = CGPointMake(frame.size.width / 2.0, frame.size.height)
        
        path.moveToPoint(start)
        
        // right side of arrow
        
        var point = CGPointMake(start.x + CGFloat(arrowHeight * tan(arrowAngle)), start.y - arrowHeight - bubbleLineWidth)
        path.addLineToPoint(point)
        
        // lower right
        
        point.x = frame.size.width - cornerRadius - bubbleLineWidth / 2.0
        path.addLineToPoint(point)
        
        // lower right corner
        
        point.x += cornerRadius
        var controlPoint = point
        point.y -= cornerRadius
        path.addQuadCurveToPoint(point, controlPoint: controlPoint)
        
        // right
        
        point.y -= frame.size.height - arrowHeight - cornerRadius * CGFloat(2.0) - bubbleLineWidth * CGFloat(1.5)
        path.addLineToPoint(point)
        
        // upper right corner
        
        point.y -= cornerRadius
        controlPoint = point
        point.x -= cornerRadius
        path.addQuadCurveToPoint(point, controlPoint: controlPoint)
        
        // top
        
        point.x -= (frame.size.width - cornerRadius * 2.0 - bubbleLineWidth)
        path.addLineToPoint(point)
        
        var lowerLeftPoint = point
        lowerLeftPoint.y += cornerRadius
        
        // top left corner
        
        point.x -= cornerRadius
        controlPoint = point
        point.y += cornerRadius
        path.addQuadCurveToPoint(point, controlPoint: controlPoint)
        
        // left
        
        point.y += frame.size.height - arrowHeight - cornerRadius * CGFloat(2.0) - bubbleLineWidth * CGFloat(1.5)
        path.addLineToPoint(point)
        
        // lower left corner
        
        point.y += cornerRadius
        controlPoint = point
        point.x += cornerRadius
        path.addQuadCurveToPoint(point, controlPoint: controlPoint)
        
        // lower left
        
        point = CGPointMake(start.x - CGFloat(arrowHeight * tan(arrowAngle)), start.y - arrowHeight - bubbleLineWidth)
        path.addLineToPoint(point)
        
        // left side of arrow
        
        path.closePath()
        
        // draw the callout bubble
        
        bubbleFillColor.setFill()
        bubbleStrokeColor.setStroke()
        path.lineWidth = bubbleLineWidth
        
        path.fill()
        path.stroke()
    }
    
}
