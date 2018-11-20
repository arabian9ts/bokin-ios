//
//  BokinRequest.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol BokinRequest {
    associatedtype Response: Mappable
    
    var path: String { get }
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var params: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

extension BokinRequest {
    var baseURL: URL {
        return URL(string: "https://github-trending-api.now.sh")!
        //        return URL(string: "http://localhost:3000")!
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    func buildDataRequest() -> DataRequest {
        let url = baseURL.appendingPathComponent(path)
        var encoding: ParameterEncoding {
            switch method {
            case .post, .put, .delete:
                return JSONEncoding.default
            case .get:
                return URLEncoding.default
            default:
                return URLEncoding.default
            }
        }
        
        let dataRequest = Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
        return dataRequest
    }
    
    
    // == for a json response
    
    //    func response(from data: Any?) -> Response? {
    //        let response = Mapper<Response>().map(JSONObject: data!)
    //        return response
    //    }
    
    
    // == for an array response
    
    func response(from data: Any?) -> Response? {
        let response = Mapper<Response>().map(JSONObject: ["entities" : data!])
        return response
    }
}
