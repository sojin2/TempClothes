//
//  tmConvertDTO.swift
//  OOTD
//
//  Created by Jay on 2022/02/15.
//

import Foundation

struct DocumentDTO:Codable{
    let documents : [TMConvertDTO]
}
struct TMConvertDTO:Codable{
    let x:Double
    let y:Double
    

//        documents <- map["documents"]

}
