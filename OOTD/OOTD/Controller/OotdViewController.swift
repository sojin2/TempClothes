//
//  OotdViewController.swift
//  OOTD
//
//  Created by Jay on 2022/02/12.
//

import UIKit
import SnapKit
import CoreLocation
import Alamofire

final class OotdViewController:UIViewController{
    
        //LocationManager 선언
        let locationManager = CLLocationManager()
        
        //위도와 경도
        var latitude: Double?
        var longitude: Double?
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .orange
        self.getLocation()
        self.loadData()
    }
    
    
}
extension OotdViewController{
    
    
    private func setupView(){
        
    }
    
    private func loadData(){
        let urlString = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
        let api_key = "k579AqimNC8xESaDf7QgPswSX9PKUWg5W0SqeOUjR5%2FtrDwCN%2Bq0mngCQGk5%2FPCnk9XHzvc3vipJA%2BOCXlOhuA%3D%3D"
        

        let requestDic:[String : Any] = [
            "ServiceKey" : api_key.decodeUrl()!,
            "pageNo" : 1,
            "numOfRows" : 15,
            "dataType" : "JSON",
            "base_date" : self.getTodayDate(),
            "base_time" : "0200",
            "nx" : Int(self.latitude ?? 0),
            "ny" : Int(self.longitude ?? 0)
        ]
       
        LoadAPI.getWeatherAPI(urlString: urlString, requestDic: requestDic){ data in
            let model = try? JSONDecoder().decode(Welcome.self, from: data)
            print(model)
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
    private func getTodayDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let nowDate = dateFormatter.string(from: Date())
        return nowDate
    }
    
}

extension OotdViewController: CLLocationManagerDelegate{
    

    private func getLocation(){
        //locationManager 델리게이트 생성
        self.locationManager.delegate = self
        //포그라운드 상태에서 위치 추적 권한 요청
        self.locationManager.requestWhenInUseAuthorization()
        
        //배터리에 맞게 권장되는 최적의 정확도
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //위치업데이트
        self.locationManager.startUpdatingLocation()
        
        //위도 경도 가져오기
        let coor = locationManager.location?.coordinate
        self.longitude = coor?.longitude // x
        self.latitude = coor?.latitude //y
        
        print(coor)
        //여기서부터 TM 변한
//        let url = "https://dapi.kakao.com/v2/local/geo/transcoord.json"
//        let param:Parameters = [
//            "x": longitude,
//            "y": latitude,
//            "input_coord" : "WGS84",
//            "output_coord": "TM"]
//
//               let headers: HTTPHeaders = ["Authorization":"KakaoAK 3b9622f0285c753ec6c27f91e263812d"]
//
//        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseString{ response in
//
//            print(response)
////            if let data = response.data {
////
////                let model = try? JSONDecoder().decode(DocumentDTO.self, from: data)
////                print(data)
////            } else {
////                if let err = response.error {
////                    print(err)
////                    print("에러당당")
////                }
////            }
//
//
//        }
        
//               Alamofire.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseObject{
//                   (response: DataResponse<TMConvertDTO>) in
//                   let tmConvertDTO = response.result.value
//
//
//                   //defData에 집어넣기
//                   self.defData.tmX = tmConvertDTO!.documents![0].x!
//                   self.defData.tmY = tmConvertDTO!.documents![0].y!
//
//
//                   self.nearChecker()
//
//               }
        

        
    }
 
}
//api - key decode
extension String {
    func decodeUrl() -> String?{
        return self.removingPercentEncoding
        
    }
    func encodeUrl() -> String?{
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
    }
    
}
