//
//  PaymentManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation
import UIKit

protocol PaymentManagerToBitStatusVCDelegate: class {
    func createPaymentProcessSuccess(_ processId: String,_ processToken: String)
    func setBitPaymentFailure()
    func setBitPaymentSuccess(_ transectionId: String)
    func cancelBitPayment()
    func bitOpened()
    func createPaymentProcessFaild(error: Error)
}

public class PaymentManager {
    
    public static var shared = PaymentManager()
    
    weak var delegate: PaymentManagerToBitStatusVCDelegate?
    
    //if it's true getBitPatymentRequest not called, trigger is X button on BitStatusVIewController
    public var isTappedOnExitBtn = false
    private var response = false
    public var createPaymentProcess: CreatePaymentProcessResponse?
    
    public func callCreatePaymentProcess(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        PaymentManager.shared.isTappedOnExitBtn = false
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = CreatePaymentProcessRequest.createPaymentProcessDictParams()
        let request    = CreatePaymentProcessRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callGetBitPaymentStatusRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = Dict()
        let request    = GetBitPaymentStatusRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callCancelBitPaymentRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = CancelBitPaymentRequest.createCancelBitPaymentParams()
        let request    = CancelBitPaymentRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callCancelBitTransactionRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = CancelBitTransactionRequest.createCancelBitTransactionParams()
        let request    = CancelBitTransactionRequest().initWithDictParams(parameters, delegate)
        request.showLoader = true
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callSetBitPaymentRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = SetBitPaymentRequest.createSetBitPaymentParams()
        let request    = SetBitPaymentRequest().initWithDictParams(parameters, delegate)
        request.showErrorMsg = false
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callGetPaymentProcessInfoRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = GetPaymentProcessInfoRequest.createGetPaymentProcessInfoParams()
        let request    = GetPaymentProcessInfoRequest().initWithDictParams(parameters, delegate)
        request.showLoader = true
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callSettleSuspendedTransactionRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = SettleSuspendedTransactionRequest.createSettleSuspendedTransactionDictParams()
        let request    = SettleSuspendedTransactionRequest().initWithDictParams(parameters, delegate)
        request.showLoader = true
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callDoPayment(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let doPaymentArr = createPaymentProcess?.doPaymentRequestArr ?? DoPaymentRequestArr()
        let parameters = DoPaymentRequest.createDoPaymentParams(doPaymentArr)
        let request    = DoPaymentRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    private func handleBitAppStartProcces() {
        let url = createPaymentProcess?.url ?? ""
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: Dict()) { _ in
                self.delegate?.bitOpened()
            }
        }
    }
    
    private func userDidaponExitButton() -> Bool {
        return isTappedOnExitBtn
    }
    
    private func getError(from response: BaseServerResponse) -> Error {
        let error = Error(id: response.errorResponse.id,
                          errorMessage: response.errorResponse.message)
        return error
    }
}

extension PaymentManager: RequestFinishedProtocol {
    
    public func requestSucceeded(request: BaseRequest, response: BaseInnerResponse) {
        let requestName = request.requestName
        switch requestName {
       
        case ServerRequests.createPaymentProcess:
            handleCreatePaymentProcess(response)
            break
            
        case ServerRequests.cancelBitPayment:
            delegate?.cancelBitPayment()
            break
            
        case ServerRequests.setBitPayment:
            handleSetBitPaymentSecceeded(response)
            break
            
        case ServerRequests.settleSuspendedTransaction:
            Meshulam.shared().delegate?.settleSuspendedTransactionSuccess(response: request.responseJson)
            break
            
        case ServerRequests.doPayment:
            handleDoPaymentProcess(response)
            break
            
        case ServerRequests.getPaymentProcessInfo:
            handleGetPaymentProcessInfo(request.responseJson)
            break
            
        case ServerRequests.cancelBitTransaction:
            Meshulam.shared().delegate?.onCancel()
            break
            
        default: break
        }
    }
    
    private func handleGetPaymentProcessInfo(_ response: String) {
        Meshulam.shared().delegate?.getPaymentProcessInfoSuccess(response: response)
    }
    
    private func handleCreatePaymentProcess(_ response: BaseInnerResponse) {
        if let response = response as? CreatePaymentProcessResponse {
            createPaymentProcess = response
            if !userDidaponExitButton() {
                delegate?.createPaymentProcessSuccess(response.processId, response.processToken)
                handleBitAppStartProcces()
            }
        }
    }
    
    private func handleDoPaymentProcess(_ response: BaseInnerResponse) {
        if let response = response as? DoPaymentResponse {
            createPaymentProcess?.bitPaymentId = response.bitPaymentId
            createPaymentProcess?.url = response.url
            handleBitAppStartProcces()
        }
    }
    
    private func handleSetBitPaymentSecceeded(_ response: BaseInnerResponse) {
        if let response = response as? SetBitPaymentResponse {
            let codeSeccess = 11
            let statusSeccess = response.paymentProcessResponseInfo.transactions.first?.statusCode == codeSeccess
            if statusSeccess {
                delegate?.setBitPaymentSuccess(response.paymentProcessResponseInfo.transactions.first?.transactionId ?? "")
            }
        }
    }
    
    public func requestFailed(request: BaseRequest, response: BaseServerResponse?) {
        if let response = response {
            let requestName = request.requestName
            
            switch requestName {
            
            case ServerRequests.setBitPayment:
                delegate?.setBitPaymentFailure()
                break
                
            case ServerRequests.createPaymentProcess:
                let error = Error(id: response.errorResponse.id, errorMessage: response.errorResponse.message)
                delegate?.createPaymentProcessFaild(error: error)
                break
                
            default: break
            }
            let error = getError(from: response)
            Meshulam.shared().delegate?.onFailure(error)
        }
    }
}


