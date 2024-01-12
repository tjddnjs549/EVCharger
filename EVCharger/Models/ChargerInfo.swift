//
//  ChargerInfo.swift
//  EVCharger
//
//  Created by 박성원 on 1/10/24.
//

import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let metro: String
    let city: String
    let carType: String
    let stnPlace: String
    let stnAddr: String
    let rapidCnt: Int
    let slowCnt: Int
}

struct ChargerInfo: Codable {
    var placeName: String
    var address: String
    var rapid: Int
    var slow: Int
}



//"stnPlace":"경희궁의아침3단지 아파트"
//stnAddr":"서울특별시 종로구 관철동 7-3
//"rapidCnt":1,"slowCnt":2
//"carType":"SM3 Z.E,테슬라"
