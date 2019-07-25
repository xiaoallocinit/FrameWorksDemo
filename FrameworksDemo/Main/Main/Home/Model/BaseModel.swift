//
//  BaseModel.swift
//  Main
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit
import HandyJSON

class BaseModel: NSObject , HandyJSON{
    required override init() {}
}
class BaseResponse: BaseModel {
    var result:Int?
    var success:Bool?
    
}
class BaseHomeModel: BaseResponse {
    var data = [homeModel]()
    
}
class homeModel: BaseResponse {
    var cursor:String?
    var recommend_reason:String?
    var track_id:String?
    var user:UserModel?
    var note_list = [NoteListModel]()

}
class UserModel: BaseModel {
    var id:String?
    var name:String?
    var image:String?
    var images:String?
    var followed:Bool?
    var nickname:String?
    var red_official_verified:Bool?
    var red_official_verify_type:Int?
    var red_id:String?
}
class NoteListModel: BaseModel {
    var id:String?
    var type:String?
    var title:String?
    var desc:String?
    
    var user:UserModel?
    var time:Int?
    var liked:Bool?
    var collected:Bool?
    
    var images_list:[ImagesModel]?
    var liked_count:Int?
    var collected_count:Int?
    var comments_count:Int?
}
class ImagesModel: BaseModel {
    var fileid:String?
    var original:String?
    var url:String?
    var height:Int?
    var width:Int?
    
}
