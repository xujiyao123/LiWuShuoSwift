//
//  NetWorkRequestInfo.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/19.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit
public enum NetWorkState {
    
    case get
    
    
}

protocol NetWorkProtocol :NSObjectProtocol {
    
    func requestSuccess(result:AnyObject , operation : AFHTTPRequestOperation)
    
    func requestLose(error:NSError , operation : AFHTTPRequestOperation)
    
    
}



class NetWorkRequestInfo: NSObject {

    var urlStr: String?
    
    var state : NetWorkState?
    
    var parameters: NSDictionary?
    
    var model : NSObject?
    
    var delegate : NetWorkProtocol?
    
    init(urlstr: String? ,delegate:NetWorkProtocol?) {
        
        self.urlStr = urlstr
      
        self.state = NetWorkState.get
        
        self.delegate = delegate
        
    }
    
    func sandRequest() {
        
        let helper = NetWorkRequestHelper.shareHelper()
        
        if self.urlStr?.isEmpty == true {
            print("请输入url")
            
        }else {
            
            helper.sendAsyncRequest(self)
            
        }
        
        
    }
    
    
    
    
    
}
