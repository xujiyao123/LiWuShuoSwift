//
//  LiWuShuoModel.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/20.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class HomeScrollerModel: NSObject ,NetWorkProtocol {
    
    
    var image_url : String?
    
    var target_id : String?
    
    var type : String?
    
    var target_url: String?
    
    
    func loadHomeScrollerData() {
        let info = NetWorkRequestInfo(urlstr: HOME_SCROLLER_INTERFACE, delegate: self)
        info.sandRequest()
    }
    
    class func loadscrollerData() {
        let model = HomeScrollerModel()
        model.loadHomeScrollerData()
            
    }
    
    func requestSuccess(result: AnyObject, operation: AFHTTPRequestOperation) {
        
        let dataArray = NSMutableArray()
        
        let array = result.objectForKey("data") as! NSDictionary
        let banners = array.objectForKey("banners") as! NSArray
        
        for dic in banners {
            
            let model = HomeScrollerModel()
            model.image_url = dic.objectForKey("image_url") as? String
            model.target_id = dic.objectForKey("target_id") as? String
            model.type = dic.objectForKey("type") as? String
            model.target_url = dic.objectForKey("target_url") as? String
            
            dataArray.addObject(model)
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("HOME_SCROLLER_DATA", object: dataArray)
        
    }
    func requestLose(error: NSError, operation: AFHTTPRequestOperation) {
        print(error)
    }
    
    

}
