//
//  HomeTableViewCell.swift
//  Main
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit
import SnapKit
import BaseUIKitExtension
import GlobalConstants
import Kingfisher
class HomeTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var avatar:UIImageView = {
        let avatar = UIImageView.init()
        avatar.layer.cornerRadius = 20.0
        avatar.layer.masksToBounds = true
        avatar.isUserInteractionEnabled = true
        return avatar
    }()
    lazy var nameLab:UILabel = {
        let Lab = UILabel.init()
        Lab.textAlignment = NSTextAlignment.left
        Lab.font = UIFont.pingFangBoldFont(size: 14)
        Lab.textColor = ColorTitle
        return Lab
    }()
    lazy var TimeLab:UILabel = {
        let Lab = UILabel.init()
        Lab.textAlignment = NSTextAlignment.left
        Lab.font = UIFont.pingFangTextFont(size: 13)
        Lab.textColor = ColorGrayColor
        return Lab
    }()
    lazy var contentLab:UILabel = {
        let Lab = UILabel.init()
        Lab.textAlignment = NSTextAlignment.left
        Lab.font = UIFont.pingFangTextFont(size: 14)
        Lab.textColor = UIColor.black
        Lab.numberOfLines = 2
        return Lab
    }()
    
    lazy var photo:UIImageView = {
        let photo = UIImageView.init()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        
        return photo
    }()
    //MARK:- Method
    private func initSubViews(){
        self.backgroundColor = ColorBackGround
        
        self.addSubviews([avatar,nameLab,TimeLab,contentLab,photo])
        
        
        avatar.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.width.height.equalTo(40)
        }
        nameLab.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(avatar.snp.right).offset(10)
            make.right.equalTo(-100)
            make.height.equalTo(20)
        }
        TimeLab.snp.makeConstraints { (make) in
            make.top.equalTo(nameLab.snp.bottom)
            make.left.equalTo(avatar.snp.right).offset(10)
            make.right.equalTo(-100)
            make.height.equalTo(20)
        }
        contentLab.snp.remakeConstraints { (make) in
            make.top.equalTo(avatar.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        photo.snp.remakeConstraints { (make) in
            make.top.equalTo(contentLab.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(ImageWidth)
        }
    }
    public var model : homeModel? {
        
        didSet{
            guard let _ = model else {
                return
            }
            
            avatar.kf.setImage(urlString: model?.user?.image)
            
            nameLab.text = model?.user?.nickname
           TimeLab.text = Date.timeStampChangeDate(model?.note_list.first?.time ?? 0)
            
            contentLab.text = model?.note_list.first?.desc
            
            photo.kf.setImage(urlString: model?.note_list.first?.images_list?.first?.url)
        }
    }
}
