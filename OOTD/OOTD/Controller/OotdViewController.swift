//
//  OotdViewController.swift
//  OOTD
//
//  Created by Jay on 2022/02/12.
//

import UIKit
import SnapKit


final class OotdViewController:UIViewController{
 
    override func viewDidLoad() {
        self.view.backgroundColor = .orange
        self.loadData()
    }
}
extension OotdViewController{
    
    
    private func setupView(){
        
    }
    
    private func loadData(){
        let urlString = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
//        vejJ9z%2BevfaWK4HHI9EWdssLIRe%2FI31VBETVkH%2B1HWfVOXGdelhAHZ1a1vgdBpYMB8UzNN6USCr75LB9ynmI%2FQ%3D%3D (Encode)
        
//        vejJ9z+evfaWK4HHI9EWdssLIRe/I31VBETVkH+1HWfVOXGdelhAHZ1a1vgdBpYMB8UzNN6USCr75LB9ynmI/Q== (Decode)
        let requestDic:[String : Any] = [
            "ServiceKey" : "vejJ9z+evfaWK4HHI9EWdssLIRe/I31VBETVkH+1HWfVOXGdelhAHZ1a1vgdBpYMB8UzNN6USCr75LB9ynmI/Q==",
            "pageNo" : 1,
            "numOfRows" : 4,
            "dataType" : "JSON",
            "base_date" : "20220212",
            "base_time" : "0500",
            "nx" : 22,
            "ny" : 22
        ]
        LoadAPI.getWeatherAPI(urlString: urlString, requestDic: requestDic){ data in
            print(data)
        }
        /*
         
         페이지 번호    pageNo    4    필수    1    페이지번호
         한 페이지 결과 수    numOfRows    4    필수    1000    한 페이지 결과 수
         응답자료형식    dataType    4    옵션    XML    요청자료형식(XML/JSON) Default: XML
         발표일자    base_date    8    필수    20210628    ‘21년 6월 28일발표
         발표시각    base_time    4    필수    0500    05시 발표
         예보지점 X 좌표    nx    2    필수    55    예보지점의 X 좌표값
         예보지점 Y 좌표    ny    2    필수    127    예보지점의 Y 좌표값
         */
    
    }
}
