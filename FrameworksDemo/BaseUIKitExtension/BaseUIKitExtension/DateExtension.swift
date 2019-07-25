//
//  DateExtension.swift
//  BaseUIKitExtension
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit

extension Date {
    public func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
    
    //时间戳转时间
    public static func timeStampChangeDate(_ date:Int) -> String {
        //"yyyy-MM-dd HH:mm"
        
        let timeInterval:TimeInterval = TimeInterval(date)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        //格式话输出
        let formatter = DateFormatter.init()
        formatter.dateFormat = "MM-dd"
        return formatter.string(from: date)
    }
}
