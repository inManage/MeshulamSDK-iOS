//
//  RequestManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation
import Alamofire

public class NetworkManager {
    
    public static let shared = NetworkManager()
    
    private var baseURL = "https://plusecure.meshulam.co.il/api/light/iphone/1.0/initSDK/"
    
    public func sendRequest(_ baseRequest: BaseRequest, response: @escaping ((_: [String: Any]) -> Void)) {
        
        let parameters: [String: String] = ["udid": "uiuiuiui"]
        let headers: HTTPHeaders = ["TOKEN": "inmanga_secure"]
        
        let request = AF.request(baseURL, method: .post, parameters: parameters, headers: headers).validate()
        
        request.responseJSON { (data) in
            if let data = data.value as? [String: Any] {
                let outerResponse = baseRequest.createResponseFromJSONDict(JSONDict: data)
                
                switch outerResponse?.responseStatus {
                case .statusSuccess:
                    response(data)
                case .statusFailure:
                    response(data)
                default:
                    break
                }
            }
        }
    }
}
