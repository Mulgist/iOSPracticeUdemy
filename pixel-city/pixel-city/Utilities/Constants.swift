//
//  Constants.swift
//  pixel-city
//
//  Created by 이주원 on 2018. 2. 25..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation

// Flickr API Key
// Manual:
// API 키는 json 파일에 숨겨놓았으며 경로는 pixel-city 폴더에 저장되어 있다.
// 파일 이름: flickr-api-key.json
// 내용:
// {
//     "flickr-api-key": "key123key456...(api_key)"
// }
class FlickrApiKey {
    static let instance = FlickrApiKey()
    let API_KEY: String
    
    init() {
        let path = Bundle.main.path(forResource: "flickr-api-key", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let rawTxt = try! String(contentsOf: url, encoding: .utf8)
        var json = [String:String]()
        if let data = rawTxt.data(using: .utf8) {
            json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : String]
        }
        API_KEY = json["flickr-api-key"]!
    }
}

func flickrUrl(forApiKey key: String, withAnnotation annotation: DroppablePin, andNumberOfPhotos number: Int) -> String {
    let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(FlickrApiKey.instance.API_KEY)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=mi&per_page=\(number)&format=json&nojsoncallback=1"
    print(FlickrApiKey.instance)
    return url
}
