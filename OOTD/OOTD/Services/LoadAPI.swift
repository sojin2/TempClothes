//
//  LoadAPI.swift
//  OOTD
//
//  Created by Jay on 2022/02/12.
//

import Foundation
import Alamofire

final class LoadAPI{
    
    class func getWeatherAPI(urlString: String, requestDic: [String:Any], completion: @escaping (Data) -> Void){
        
        AF.request(urlString, method: .get, parameters: requestDic, encoding: URLEncoding.default).responseData { response in
            if let data = response.data {
                print(data)
                completion(data)
            } else {
                if let err = response.error {
                    print(err)
                    print("에러당당")
                }
            }
        }
    }
}
