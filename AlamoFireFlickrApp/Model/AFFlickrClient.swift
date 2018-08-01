//
//  AFFlickrClient.swift
//  AlamoFireFlickrApp
//
//  Created by Abhilash Khare on 7/25/18.
//  Copyright © 2018 Abhilash Khare. All rights reserved.
//

import Foundation
import Alamofire


class AFFlickrClient {
    static var sharedInstance = AFFlickrClient()
    
    fileprivate func GETImage(_ response: (DataResponse<Any>), _ completionHandlerForGETFetch: @escaping (_ result : [String : AnyObject]?, _ error : String?) ->Void)  {
        if let result = response.result.value as? [String : AnyObject] {
            if let photos = result["photos"] as? [String : AnyObject]{
                if let photo = photos["photo"] as? [[String : AnyObject]]{
                    let randomImage  = Int(arc4random_uniform(UInt32(100)))
                    if let image = photo[randomImage] as? [String : AnyObject]{
                        completionHandlerForGETFetch(image as? [String : AnyObject],nil)
                    }
                }
            }
         }
        else{
            completionHandlerForGETFetch(nil,"Error")

        }
        
    }
    
    func fetchImageGET(_ completionHandlerForGET: @escaping (_ result : [String : AnyObject]?, _ error : String?) ->Void){
        let randomPageNumber = arc4random_uniform(UInt32(1000))
        Alamofire.request("https://api.flickr.com/services/rest/", method: .get, parameters: ["method":"flickr.photos.search","api_key":"c4deaa1b0a7b77672f46c6a4b145eccc", "text":"ocean","page":randomPageNumber,"format":"json","nojsoncallback":"1"]).responseJSON { (response) in
            if response.error != nil{
                completionHandlerForGET(nil,response.error.debugDescription)
            }
            else{
                self.GETImage(response, { (result, error) in
                    if error != nil{
                        completionHandlerForGET(nil,"Error fetching random image")
                    } else {
                        completionHandlerForGET(result as? [String : AnyObject],nil)
                    }
                })
        }
    }
}

}
