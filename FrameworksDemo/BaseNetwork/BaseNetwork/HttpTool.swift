//
//  HttpTool.swift
//  BaseNetwork
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit

public final class HttpTool: NSObject {
    public typealias HttpSuccess = (_ data:[String:Any]) -> Void
    public typealias HttpFailure = (_ error:NSError) -> Void
    public static let shared = {
        return HttpTool()
    }()
    
    
}

extension HttpTool {
    public func GetLocalJsonData(JsonPath:String, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let path = Bundle.main.path(forResource: JsonPath, ofType: "json")
        let url = URL(fileURLWithPath: path ?? "")
        do {
            let json = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: json, options: JSONSerialization.ReadingOptions.mutableContainers)
            if  let jsonData = jsonData as? [String:Any]{
                success(jsonData)
            }
        } catch let error as Error? {
            
            failure(error! as NSError)
        }
        
    }
}
