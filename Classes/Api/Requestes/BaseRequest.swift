//
//  BaseRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class BaseRequest: NSObject {
    
    private var requestName: String = ""
    private var dictParams : [String: Any] = [String:Any]()
        
    public func initWithDictParams(dictParams: [String: Any]?) -> BaseRequest {
        
        if let dictParams = dictParams {
            self.dictParams = dictParams
        }
        
        return self
    }
    
    public func createResponseFromJSONDict(JSONDict: Dictionary<String,Any>) -> BaseOuterResponse? {
        return nil
    }
}
