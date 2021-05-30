//
//  BaseResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

enum ResponseStatus: Int {
    case statusFailure = 0, statusSuccess
}

public class BaseOuterResponse {
    
    var responseStatus: ResponseStatus!
    var errorResponse : ErrorResponse!
    var dictData: [String: Any]?
    var failureMessage: String?

    static let STATUS = "status"
    static let ERROR  = "err"
    static let DATA   = "data"
    
    static func initFromJSONDict(JSONDict: [String: Any], withInnerResponse innerResponse: BaseInnerResponse) -> BaseOuterResponse {
       
        let getInt  = ParseValidator.getIntForKey.self
        let getDict = ParseValidator.getDictionaryForKey.self
        
        let baseOuterResponse = BaseOuterResponse()
        let responseStatus = getInt(STATUS, JSONDict, 0)
        
        baseOuterResponse.responseStatus = ResponseStatus(rawValue: responseStatus)

        switch baseOuterResponse.responseStatus {
        
        case .statusSuccess:
            baseOuterResponse.dictData = getDict(DATA, JSONDict, [String: Any]())
            break
            
        case .statusFailure:
            
            let dictError = getDict(ERROR, JSONDict, [String: Any]())
            let errorResponse = ErrorResponse()
            
            baseOuterResponse.errorResponse = errorResponse.buildFromJSONDict(JSONDict: dictError) as? ErrorResponse

            if let message = baseOuterResponse.errorResponse.message {
                baseOuterResponse.failureMessage = message
            }
            
            break
            
        default: break
        }
        
        return baseOuterResponse
    }
}
