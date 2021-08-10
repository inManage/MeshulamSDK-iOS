import CommonCrypto
import UIKit

extension String {

    func aesEncrypt(options:Int = kCCOptionPKCS7Padding) -> String {
        let encryptKey = "meinshmaulnaamge"
        if let keyData = encryptKey.data(using: String.Encoding.utf8),
            let data = self.data(using: String.Encoding.utf8),
            let cryptData    = NSMutableData(length: Int((data.count)) + kCCBlockSizeAES128) {

            let keyLength              = size_t(kCCKeySizeAES128)
            let operation: CCOperation = CCOperation(kCCEncrypt)
            let algoritm:  CCAlgorithm = CCAlgorithm(kCCAlgorithmAES128)
            let options:   CCOptions   = CCOptions(kCCOptionECBMode | kCCOptionPKCS7Padding)

            var numBytesEncrypted :size_t = 0

            let cryptStatus = CCCrypt(operation,
                                      algoritm,
                                      options,
                                      (keyData as NSData).bytes, keyLength,
                                      "",
                                      (data as NSData).bytes, data.count,
                                      cryptData.mutableBytes, cryptData.length,
                                      &numBytesEncrypted)

            if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                cryptData.length = Int(numBytesEncrypted)
                let base64cryptString = cryptData.base64EncodedString(options: .lineLength64Characters)
                return base64cryptString


            }
            else {
                return ""
            }
        }
        return ""
    }

    func aesDecrypt(options:Int = kCCOptionPKCS7Padding) -> String {
        let encryptKey = "meinshmaulnaamge"
          if let keyData = encryptKey.data(using: String.Encoding.utf8),
              let data = NSData(base64Encoded: self, options: .ignoreUnknownCharacters),
              let cryptData    = NSMutableData(length: Int((data.length)) + kCCBlockSizeAES128) {

              let keyLength              = size_t(kCCKeySizeAES128)
              let operation: CCOperation = UInt32(kCCDecrypt)
              let algoritm:  CCAlgorithm = UInt32(kCCAlgorithmAES128)
              let options:   CCOptions   = CCOptions(kCCOptionECBMode | kCCOptionPKCS7Padding)

              var numBytesEncrypted :size_t = 0

              let cryptStatus = CCCrypt(operation,
                                        algoritm,
                                        options,
                                        (keyData as NSData).bytes, keyLength,
                                        "",
                                        data.bytes, data.length,
                                        cryptData.mutableBytes, cryptData.length,
                                        &numBytesEncrypted)

              if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                  cryptData.length = Int(numBytesEncrypted)
                  let unencryptedMessage = String(data: cryptData as Data, encoding:String.Encoding.utf8)
                  return unencryptedMessage!
              }
              else {
                  return ""
              }
          }
          return ""
      }
}

