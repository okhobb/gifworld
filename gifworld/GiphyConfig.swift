//
//  GiphyConfig.swift
//  gifworld
//
//  Created by dmitri lemmerman on 6/15/21.
//

import Foundation
import GiphyUISDK


class GiphyConfig {
    
    let apiKey = "JXSC9al3NkUHM9xGA5cWDfSh7wlGxu97"
    
    func initGiphyApi() {
        Giphy.configure(apiKey: apiKey)
    }
    
}
