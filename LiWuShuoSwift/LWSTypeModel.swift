//
//  LWSTypeModel.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/29.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class CollectionModel: NSObject , NetWorkProtocol{

    var content_url: String?
    var cover_image_url: String?
    var likes_count: NSInteger?
    var title:String?
    var next_url:String?
    
    
    func collectionData(type:Int) {
        let info = NetWorkRequestInfo(urlstr: COLLECTION_INTERFACE(type), delegate: self)
        
        info.sandRequest()
    }
    class func loadCollectionData(type:Int) {
        let model = CollectionModel()
        model.collectionData(type)
    }
    func requestSuccess(result: AnyObject, operation: AFHTTPRequestOperation) {
        let dataDic = NSMutableDictionary()
        let dataArray = NSMutableArray()
        
        let array = result.objectForKey("data") as! NSDictionary
        let paging = array.objectForKey("paging") as! NSDictionary
        let title = array.objectForKey("title") as! String
        dataDic.setObject(title, forKey: "title")
        dataDic.setObject(paging.objectForKey("next_url")!, forKey: "next_url")
        
        let items = array.objectForKey("posts") as! NSArray
        
        for dic in items {
            
            let model = CollectionModel()
            model.content_url = dic.objectForKey("content_url") as? String
            model.cover_image_url = dic.objectForKey("cover_image_url") as? String
            model.likes_count = dic.objectForKey("likes_count") as? NSInteger
            
            model.title = dic.objectForKey("title") as? String
            dataArray.addObject(model)
        }
        
        dataDic.setObject(dataArray, forKey: "data")
        
        NSNotificationCenter.defaultCenter().postNotificationName("COLLECTION_DATA", object: dataDic)
    }
    func requestLose(error: NSError, operation: AFHTTPRequestOperation) {
        
    }
    
    
}
