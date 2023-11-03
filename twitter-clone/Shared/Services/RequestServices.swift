//
//  RequestServices.swift
//  twitter-clone (iOS)
//
//  Created by cem on 8/10/21.
//

import Foundation

public class RequestServices {
    public static var requestDomain = ""
    
    public static func postTweet(text: String, user: String, username: String, userId: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
        
            let params = ["text" : text, "userId" : userId, "user": user, "username" : username] as [String : Any]
            
            let url = URL(string: requestDomain)!
            
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            }
            catch let error {
                print(error)
            }
        
            let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
            print("Bearer \(token)")
            
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        
            let task = session.dataTask(with: request) { data, res, err in
                guard err == nil else { return }
                
                guard let data = data else { return }
                
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        completion(json)
                    }
                }
                catch let error {
                    print(error)
                }
            }
            
            task.resume()
    }
    
    static func fetchData(completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
            
            let url = URL(string: requestDomain)!
            
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
           
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            let task = session.dataTask(with: request) { data, res, err in
                guard err == nil else {
                    completion(.failure(.noData))
                    return
                    
                }
                
                guard let data = data else { return }
                
                completion(.success(data))
            }
            
            task.resume()
    }
    
    public static func likeTweet(id: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
        
            let params = ["id" : id] as [String : Any]
            
            let url = URL(string: requestDomain)!
            
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "PUT"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            }
            catch let error {
                print(error)
            }
        
            let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
            print("Bearer \(token)")
            
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        
            let task = session.dataTask(with: request) { data, res, err in
                guard err == nil else { return }
                
                guard let data = data else { return }
                
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        completion(json)
                    }
                }
                catch let error {
                    print(error)
                }
            }
            
            task.resume()
    }
    
    public static func followingProcess(id: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
        
            let params = ["id" : id] as [String : Any]
            
            let url = URL(string: requestDomain)!
            
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "PUT"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            }
            catch let error {
                print(error)
            }
        
            let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
            print("Bearer \(token)")
            
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        
            let task = session.dataTask(with: request) { data, res, err in
                guard err == nil else { return }
                
                guard let data = data else { return }
                
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        completion(json)
                    }
                }
                catch let error {
                    print(error)
                }
            }
            
            task.resume()
    }
    
    public static func sendNotification(username: String, notSenderId: String, notReceiverId: String, notificationType: String, postText: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
        
        
            var params : [String: Any] {
                return postText.isEmpty ? ["username": username, "notSenderId": notSenderId, "notReceiverId": notReceiverId, "notificationType": notificationType] as [String : Any] : ["username": username, "notSenderId": notSenderId, "notReceiverId": notReceiverId, "notificationType": notificationType, "postText": postText] as [String : Any]
            }
            
            let url = URL(string: requestDomain)!
            
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            }
            catch let error {
                print(error)
            }
        
            let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
            print("Bearer \(token)")
            
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        
            let task = session.dataTask(with: request) { data, res, err in
                guard err == nil else { return }
                
                guard let data = data else { return }
                
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        completion(json)
                    }
                }
                catch let error {
                    print(error)
                }
            }
            
            task.resume()
    }
    
    
//    public static func login(email: String, password: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
//        let urlString = URL(string: requestDomain + "/auth/login/\(email)/\(password)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
//        makeRequest(urlString: urlString, completion: completion)
//    }
//
//    public static func register(email: String, password: String, name: String, completion: @escaping (_ result: [String:Any]?) -> Void) {
//        let urlString = URL(string: requestDomain + "/auth/register/\(email)/\(password)/\(name)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
//        makeRequest(urlString: urlString, completion: completion)
//    }
//
//    static func makeRequest(urlString: URL, completion: @escaping (_ result: [String:Any]?) -> Void) {
//        let urlRequest = URLRequest(url: urlString)
//        print("sending request")
//        print(urlRequest.description)
//
//        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if (error == nil && data != nil) {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
//                    print("Received valid response")
//                    print(json ?? [])
//                    return completion(json)
//                } catch {
//                }
//            }
//            completion(nil)
//        }
//        task.resume()
//    }
}
