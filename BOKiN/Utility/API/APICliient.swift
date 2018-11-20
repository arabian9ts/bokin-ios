//
//  APICliient.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Alamofire

class APIClient {
    static let shared = APIClient()
    
    func send<Request: RepositoryRequest>(request: Request, completion: @escaping (Result<Request.Response?>) -> Void) {
        let dataRequest = request.buildDataRequest()
        
        dataRequest
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if let error = response.error {
                    print(error)
                    completion(Result.failure(APIClientError.connectionError(error)))
                }
                else {
                    switch response.result {
                    case .failure(let error):
                        let apiError = error as? GitHubAPIError
                        completion(Result.failure(APIClientError.apiError(apiError!)))
                    case .success:
                        let responseModel = request.response(from: response.result.value)
                        completion(Result.success(responseModel))
                    }
                }
        }
    }
}
