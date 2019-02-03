import Foundation
import Alamofire

protocol UploadFileApi {
  func upload(filePath: URL)
}

class PDFUploadFileApi : UploadFileApi {
  
  func upload(filePath: URL) {
    let headers: HTTPHeaders = []
    let url = try! URLRequest(url: "http://localhost:8000/upload", method: .post, headers: headers)
    AF.upload(multipartFormData: { multipartFormData in
      multipartFormData.append(filePath, withName: "file")
    }, with: url).response { (result) in
      print(result.description)
    }
  }
  
}
