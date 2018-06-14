//
//  HttpClient.swift
//  Ejianqian
//
//  Created by wangjiayu on 2018/6/13.
//  Copyright © 2018年 wangjiayu. All rights reserved.
//

import Alamofire

//enum MethodType {
//    case GET
//    case POST
//}
//
//enum RequestType:Int {
//    case FORM = 0
//    case JSON = 1
//}
//
//var host:String{
//    #if DEBUG
//        return "测试的域名"
//    #else
//        return "正式的域名"
//    #endif
//}


class HttpClient {
    static let httpClient:HttpClient = HttpClient()
    private init () { }
}

extension HttpClient {

    func postRequest(url:String,parameters:Parameters? = nil,finished:@escaping(_ response:Any?,_ error:String?)->Void) {
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error!)
                finished(nil,response.result.error?.localizedDescription)
                return
            }
            
            finished(result, nil)
        }
    }
    
    func getRequest(url:String,parameters:Parameters? = nil,finished:@escaping(_ response:Any?,_ error:String?)->Void) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error!)
                finished(nil,response.result.error?.localizedDescription)
                return
            }
            
            finished(result, nil)
        }
    }
}



