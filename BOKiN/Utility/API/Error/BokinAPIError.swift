//
//  BokinAPIError.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

struct BokinAPIError: Error {
    struct FieldError {
        let resource: String
        let field: String
        let code: String
    }
    
    let message: String
    let fieldErros: [FieldError]
}
