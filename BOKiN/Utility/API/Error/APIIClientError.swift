//
//  APIIClientError.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

enum APIClientError: Error {
    case connectionError(Error)
    case apiError(BokinAPIError)
}
