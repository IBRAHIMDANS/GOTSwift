//
//  RequestManager.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//
import Foundation
import Alamofire

struct APIHandler {
    static func requestHouses(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request("https://api.got.show/api/show/houses").responseData {
            (data) in
            switch data.result {
            case .success(let value):
                print(value)
                success(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
    
    static func requestCharacterByHouse(houseName: String, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        let formattedHouseName = houseName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        Alamofire.request("https://api.got.show/api/show/characters/byHouse/\(formattedHouseName ?? "")").responseData {
            (data) in
            switch data.result {
            case .success(let value):
                print(value)
                success(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
}
