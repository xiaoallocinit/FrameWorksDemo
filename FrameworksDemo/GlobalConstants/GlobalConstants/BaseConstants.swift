//
//  BaseConstants.swift
//  GlobalConstants
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit
import Kingfisher
import BaseUIKitExtension

public let ScreenW = UIScreen.main.bounds.width
public let ScreenH = UIScreen.main.bounds.height
public let screenFrame:CGRect = UIScreen.main.bounds
public let isIPhoneX = (ScreenW == 375 && ScreenH == 812 || ScreenW == 414 && ScreenH == 896  ? true : false)
public let statusBarH : CGFloat  = (isIPhoneX ? 34 :20)
public let SafeBottomMargin : CGFloat = (isIPhoneX ? 34 : 0)
public let navigationBarHeight : CGFloat = isIPhoneX ? 88 : 64
public let tabBarHeight : CGFloat = isIPhoneX ? 49 + 34 : 49
public let ScreenScale = ScreenW/ScreenH
public let ScaleW = UIScreen.main.bounds.size.width / 414
public let ImageWidth: CGFloat =  ScreenW*0.75




//MARK: Color

public let ColorLine     = UIColor.colorWithHex(hex: 0xF8F8F8)
public let ColorWhite     = UIColor.colorWithHex(hex: 0xFFFFFF)
public let ColorBackGround      = UIColor.colorWithHex(hex: 0xF8F8F8)
public let ColorTitle   = UIColor.colorWithHex(hex: 0x171B1E)
public let ColorLargeTitle   = UIColor.colorWithHex(hex: 0x222222)
public let ColorBlackTitle   = UIColor.colorWithHex(hex: 0x666666)
public let ColorGrayTitle   = UIColor.colorWithHex(hex: 0x555555)
public let ColorDarkGrayTextColor = UIColor.colorWithHex(hex: 0x999999)
public let ColorLightTitleColor = UIColor.colorWithHex(hex: 0xCECECE)
public let ColorGrayColor = UIColor.colorWithHex(hex: 0xB6B6B6)


//MARK: Kingfisher
extension Kingfisher where Base: ImageView {
    @discardableResult
    public func setImage(urlString: String?, placeholder: Placeholder? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
        return setImage(with: URL(string: urlString ?? ""),
                        placeholder: placeholder,
                        options:[.transition(.fade(0.5))])
    }
}

extension Kingfisher where Base: UIButton {
    @discardableResult
    public func setImage(urlString: String?, for state: UIControl.State, placeholder: UIImage? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
        return setImage(with: URL(string: urlString ?? ""),
                        for: state,
                        placeholder: placeholder,
                        options: [.transition(.fade(0.5))])
        
    }
}
