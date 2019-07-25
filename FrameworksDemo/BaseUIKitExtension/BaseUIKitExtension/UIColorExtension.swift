//
//  UIColorExtension.swift
//  UIKitExtension
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit

extension UIColor {
    
    public class func colorWithRGBA(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor{
        
        return self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    public class func colorWithRGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor{
        
        return colorWithRGBA(r: r, g: g, b: b, alpha: 1)
    }
    
    public class func colorWithHex(hex : Int) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1)
    }
    
    public class func colorWithHex(hex : Int , alpha : CGFloat) -> UIColor{
        return UIColor.init(red: CGFloat((hex >> 16) & 0xFF)/255.0 , green: CGFloat((hex >> 8) & 0xFF)/255.0 , blue: CGFloat(hex & 0xFF)/255.0 , alpha: alpha)
    }
    
    public class func randomColor() -> UIColor {
        return colorWithRGB(r: CGFloat(arc4random_uniform(256)),
                            g: CGFloat(arc4random_uniform(256)),
                            b: CGFloat(arc4random_uniform(256)))
    }
    
    // 颜色16 进制 转换  样式 #5B5B5B
    public class func UIColorFromRGB(color_vaule : String , alpha : CGFloat = 1) -> UIColor {
        
        if color_vaule.isEmpty {
            return UIColor.clear
        }
        
        var cString = color_vaule.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if cString.count == 0 {
            return UIColor.clear
        }
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count < 6 && cString.count != 6 {
            
            return UIColor.clear
        }
        
        let value = "0x\(cString)"
        
        let scanner = Scanner(string:value)
        
        var hexValue : UInt64 = 0
        //查找16进制是否存在
        if scanner.scanHexInt64(&hexValue) {
            //            print(hexValue)
            let redValue = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
            let greenValue = CGFloat((hexValue & 0xFF00) >> 8)/255.0
            let blueValue = CGFloat(hexValue & 0xFF)/255.0
            return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
        }else{
            return UIColor.clear
        }
    }
}
