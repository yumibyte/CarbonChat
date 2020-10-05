//
//  NetworkManager.swift
//  CarbonChatApp
//
//  Created by wenlock on 10/4/20.
//

import Foundation

final class NetworkManager {

  var pingdata = CarbonChatPing(withMessage: "no ping data found")
  private let domainUrlString = "https://carbonchat.herokuapp.com/"
  
 
  func fetchPing(completionHandler: @escaping (CarbonChatPing) -> Void) {
    let url = URL(string: domainUrlString + "ping")!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error returning ping form carbonchat: " + String(describing: error))
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
        print("Unexpected response status code: "  + String(describing: response))
        return
      }

      if let data = data,
        let pingdata = try? JSONDecoder().decode(CarbonChatPing.self, from: data) {
          completionHandler(pingdata)
      }
    }
    task.resume()
  }
}
