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

public class BaseServerResponse {
    
    var responseStatus: ResponseStatus!
    var errorResponse : ErrorResponse!
    var innerResponse : BaseInnerResponse!

    var dictData: Dict?
    var failureMessage: String?

    static let STATUS = "status"
    static let ERROR  = "err"
    static let DATA   = "data"
    
    static func initFromJSONDict(JSONDict: Dict, withInnerResponse innerResponse: BaseInnerResponse) -> BaseServerResponse {
       
        let getInt  = ParseValidator.getIntForKey.self
        let getDict = ParseValidator.getDictionaryForKey.self
        
        let baseOuterResponse = BaseServerResponse()
        let responseStatus = getInt(STATUS, JSONDict, 0)
        
        baseOuterResponse.responseStatus = ResponseStatus(rawValue: responseStatus)

        switch baseOuterResponse.responseStatus {
        
        case .statusSuccess:
            baseOuterResponse.dictData = getDict(DATA, JSONDict, Dict())
            
            if let dictData = baseOuterResponse.dictData {
                baseOuterResponse.innerResponse = innerResponse.buildFromJSONDict(JSONDict: dictData)
            }
    
            break
            
        case .statusFailure:
            
            let dictError = getDict(ERROR, JSONDict, Dict())
            let errorResponse = ErrorResponse()
            
            baseOuterResponse.errorResponse = errorResponse.buildFromJSONDict(JSONDict: dictError) as? ErrorResponse

            if !baseOuterResponse.errorResponse.message.isEmpty {
                baseOuterResponse.failureMessage = baseOuterResponse.errorResponse.message
            }
            
            break
            
        default: break
        }
        
        return baseOuterResponse
    }
}
