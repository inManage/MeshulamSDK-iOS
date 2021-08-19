//
//  BaseRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class MeshulamBaseRequest: NSObject {
    
    private(set) var dictParams : Dict = Dict()
    public var requestName: String { get { "" } }
    
    var showErrorMsg: Bool = true
    var requestFinishedDelegate: MeshulamRequestFinishedProtocol?
    var requestAttemptsCounter: Int = 0
    var maxAllowedRequestAttempts: Int = 3
    var responseJson: String = ""
    var showLoader: Bool = false
    
    public func initWithDictParams(_ dictParams: Dict?, _ delegate: MeshulamRequestFinishedProtocol?) -> MeshulamBaseRequest {
        
        if let dictParams = dictParams {
            self.dictParams = dictParams
        }
        
        if let delegate = delegate {
            self.requestFinishedDelegate = delegate
        }
        
        resetRequestAttemptsCounter()
        
        return self
    }
    
    public func createResponseFromJSONDict(JSONDict:Dictionary<String,Any>) -> MeshulamBaseServerResponse? {
        return nil
    }
    
    public func shouldAttemptSendingRequestAgain() -> Bool{
        return requestAttemptsCounter < self.maxAllowedRequestAttempts
    }
    
    public func increaseRequestAttemptsCounter() {
        requestAttemptsCounter += 1
    }
    
    public func resetRequestAttemptsCounter() {
        requestAttemptsCounter = 0
    }
}
