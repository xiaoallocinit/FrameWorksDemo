//
//  UIViewExtension.swift
//  UIKitExtension
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit


extension UIView {
    public func addSubviews(_ views: [UIView]) {
        views.forEach { [weak self] eachView in
            self?.addSubview(eachView)
        }
    }
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.y, width: self.w, height: self.h)
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.w, height: self.h)
        }
    }
    
    public var w: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.h)
        }
    }
    
    
    public var h: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.w, height: value)
        }
    }
    
 
    public var left: CGFloat {
        get {
            return self.x
        } set(value) {
            self.x = value
        }
    }
    
    public var right: CGFloat {
        get {
            return self.x + self.w
        } set(value) {
            self.x = value - self.w
        }
    }
    
    public var top: CGFloat {
        get {
            return self.y
        } set(value) {
            self.y = value
        }
    }
 
    public var bottom: CGFloat {
        get {
            return self.y + self.h
        } set(value) {
            self.y = value - self.h
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        } set(value) {
            self.frame = CGRect(origin: value, size: self.frame.size)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        } set(value) {
            self.center.x = value
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        } set(value) {
            self.center.y = value
        }
    }
   
    public var size: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame = CGRect(origin: self.frame.origin, size: value)
        }
    }
    
   
  
    public func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
   
    
}
extension UIView{
   
    public func curViewController() -> UIViewController{
        
        var next = self.next
        
        repeat{
            if next?.isKind(of: UIViewController.self) ?? false {
                return next as? UIViewController ?? UIViewController.init()
            }
            next = next?.next
        }while (next != nil)
        
        return UIViewController.init();
    }
    
    public func curTableView() -> UITableView {
        var next = self.next
        
        repeat{
            if next?.isKind(of: UITableView.self) ?? false {
                return next as? UITableView ?? UITableView.init()
            }
            next = next?.next
        }while (next != nil)
        
        return UITableView.init()
    }
    
    public func curCollectionView() -> UICollectionView {
        var next = self.next
        
        repeat{
            if next?.isKind(of: UICollectionView.self) ?? false {
                return next as? UICollectionView ?? UICollectionView.init()
            }
            next = next?.next
        }while (next != nil)
        
        return UICollectionView.init()
    }
    
    public func addTapGesture(tapNumber: Int = 1, target: AnyObject, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    // MARK: 移除渐变图层
    // （当希望只使用backgroundColor的颜色时，需要先移除之前加过的渐变图层）
    public func removeGradientLayer() {
        if let layers = self.layer.sublayers {
            for layer in layers {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    public func addGradientLayer(
        start: CGPoint = CGPoint(x: 0, y: 0.5), //渐变起点
        end: CGPoint = CGPoint(x: 1, y: 0.5), //渐变终点
        colors: [CGColor] ) {
        layoutIfNeeded()
        var gradientLayer: CAGradientLayer!
        removeGradientLayer()
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.layer.bounds
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.backgroundColor = UIColor.clear
        
        self.layer.masksToBounds = true
        
    }
    public func addButtonGradientLayer()
    {
        
        // 外界如果改变了self的大小，需要先刷新
        layoutIfNeeded()
        
        var gradientLayer: CAGradientLayer!
        
        removeGradientLayer()
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.layer.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.colorWithHex(hex: 0x685FD5).cgColor, UIColor.colorWithHex(hex: 0xA435FC).cgColor]
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        // 渐变图层插入到最底层，避免在uibutton上遮盖文字图片
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.backgroundColor = UIColor.clear
        
        self.layer.masksToBounds = true
        
    }
    
    
}
