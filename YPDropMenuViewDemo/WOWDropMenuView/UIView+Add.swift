//
//  UIView+Add.swift
//  WowLib
//
//  Created by 王云鹏 on 16/3/18.
//  Copyright © 2016年 wowdsgn. All rights reserved.
//

import Foundation
import UIKit

class ActionManager:NSObject{
    var actionDict:Dictionary<NSValue,()->()> = Dictionary()
    static let sharedManager = ActionManager()
    override private init(){}
}

public extension UIView{
//MARK:Layer
    func borderColor(borderWidth:CGFloat,borderColor:UIColor){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
    }
    
    func borderRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    
    /**
     * 默认为为grayColor
     * 默认透明度为0.5
     * 默认扩散范围为2
     * 默认阴影范围为size(1,1)
     - parameter color:
     */
    func shadow(color:UIColor = UIColor.grayColor(),shadowOpacity:Float = 0.5,shadowRadius:CGFloat = 2,shadowOffset:CGSize = CGSizeMake(1, 1)) {
        self.layer.shadowColor = color.CGColor // 阴影的颜色
        self.layer.shadowOpacity = shadowOpacity // 阴影透明
        self.layer.shadowRadius = shadowRadius //// 阴影扩散的范围控制
        self.layer.shadowOffset = shadowOffset // 阴影的范围

    }
    
    
//MARK:ACTION
    func addAction(closure:()->()){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.tapClick(_:)))
        self.addGestureRecognizer(tap)
        ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: self)] = closure
    }
    
    func tapClick(tap:UITapGestureRecognizer){
        if let closure = ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: tap.view)]{
            closure()
        }else{
            
        }
    }

//MARK:Frame
    var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
    }
    
    var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    /**
     *  bottom, right, width, height
     */
    var bottom:CGFloat {
        return CGRectGetMaxY(self.frame)
    }
    var right:CGFloat {
        return CGRectGetMaxX(self.frame)
    }
    var width:CGFloat {
        get {
            return CGRectGetWidth(self.frame)
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    var height:CGFloat {
        get {
            return CGRectGetHeight(self.frame)
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /**
     *  origin, size
     */
    var origin:CGPoint {
        get {
            return self.frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var size:CGSize {
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    /**
     *  centerX, centerY
     */
    var centerX:CGFloat {
        get {
            return self.center.x;
        }
        
        set {
            self.center.x = newValue
        }
    }
    
    var centerY:CGFloat {
        get {
            return self.center.y;
        }
        
        set {
            self.center.y = newValue
        }
    }

    
}
