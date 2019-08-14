//
//  API.swift
//  Reddit
//
//  Created by Carson Katri on 8/1/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation
import Request

class API {
    static let `default` = API()
    
    init() {
        if let refreshToken = self.refreshToken {
            Request {
                Url("https://www.reddit.com/api/v1/access_token")
                Method(.post)
                Header.Authorization(.basic(username: clientId, password: ""))
                Query(["grant_type":"refresh_token","refresh_token":refreshToken])
            }
            .onJson { json in
                print(json)
                if let token = json.access_token.stringOptional {
                    self.token = token
                }
            }
            .call()
        }
    }
    
    func subredditURL(_ subreddit: String, _ sortBy: SortBy) -> String {
        return "https://www.reddit.com/r/\(subreddit)/\(sortBy.rawValue).json"
    }
    
    func userPostsURL(for username: String) -> String {
        return "https://www.reddit.com/user/\(username)/submitted.json"
    }
    
    func postURL(_ subreddit: String, _ id: String) -> String {
        return "https://www.reddit.com/r/\(subreddit)/\(id).json"
    }
    
    func userCommentsURL(for username: String) -> String {
        return "https://www.reddit.com/user/\(username)/comments.json"
    }
    
    // MARK: OAuth
    private static let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let randomString: String = String((0..<10).map{ _ in letters.randomElement()! })
    
    var config: [String:AnyObject] {
        var format =  PropertyListSerialization.PropertyListFormat.xml
        let path = Bundle.main.path(forResource: "API", ofType: "plist")
        if let xml = FileManager.default.contents(atPath: path!) {
            do {
                return try PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: &format) as! [String:AnyObject]
            } catch {
                print(error)
            }
        }
        return [:]
    }
    
    var clientId: String {
        config["clientId"] as! String
    }
    
    var redirectUri: String {
        config["redirectUri"] as! String
    }
    
    var scope: String {
        config["scope"] as! String
    }
    
    func oauthLoginURL() -> String {
        return "https://www.reddit.com/api/v1/authorize.compact?client_id=\(clientId)&response_type=code&state=\(randomString)&redirect_uri=\(redirectUri)&duration=permanent&scope=\(scope)"
    }
    
    var token: String? {
        get {
            UserDefaults.standard.string(forKey: "oauth_token")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "oauth_token")
        }
    }
    
    var refreshToken: String? {
        get {
            UserDefaults.standard.string(forKey: "refresh_token")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "refresh_token")
        }
    }
    
    func saveToken(_ code: String, state: String) {
        if state == randomString {
            Request {
                Url("https://www.reddit.com/api/v1/access_token")
                Method(.post)
                Header.Authorization(.basic(username: clientId, password: ""))
                Query(["grant_type":"authorization_code","code":code,"redirect_uri":redirectUri])
            }
            .onJson { json in
                if let token = json.access_token.stringOptional {
                    self.token = token
                }
                if let refreshToken = json.refresh_token.stringOptional {
                    self.refreshToken = refreshToken
                }
            }
            .call()
        } else {
            print("\(state) doesn't match \(randomString)")
        }
    }
    
    var loggedIn: Bool {
        return token != nil && refreshToken != nil
    }
    
    func logout() {
        token = nil
        refreshToken = nil
    }
    
    func authedRequest(_ url: String) -> Request {
        Request {
            Url(url)
            Header.Authorization(.bearer(API.default.token!))
        }
    }
    
    var karma: Request {
        authedRequest("https://oauth.reddit.com/api/v1/me/karma")
    }
    
    var me: Request {
        authedRequest("https://oauth.reddit.com/api/v1/me")
    }
    
    func comment(_ text: String, on parentId: String) {
        Request {
            Url("https://oauth.reddit.com/api/comment")
            Method(.post)
            Header.Authorization(.bearer(API.default.token!))
            Body([
                "api_type": "json",
                "thing_id": parentId,
                "text": text
            ])
        }
        .onError { error in
            print(error)
        }
        .onJson { json in
            print(json)
        }
        .call()
    }
}
