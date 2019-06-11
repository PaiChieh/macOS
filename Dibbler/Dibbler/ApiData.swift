//
//  ApiData.swift
//  Dibbler
//
//  Created by apple on 2019/5/27.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Foundation

class ApiData {
    
    struct URLSetting {
        //https://developers.google.com/youtube/v3/docs/search/list
        
        //default 5(0 ~ 50)
        static let maxResults:Int = 10
        
        enum order: String
        {
            //Resources are sorted in reverse chronological order based on the date they were created.
            case date = "date"
            //Resources are sorted from highest to lowest rating.
            case rating = "rating"
            //Resources are sorted based on their relevance to the search query. This is the default value for this parameter.
            case relevance = "relevance"
            //Resources are sorted alphabetically by title.
            case title = "title"
            //Channels are sorted in descending order of their number of uploaded videos.
            case videoCount = "videoCount"
            //Resources are sorted from highest to lowest number of views. For live broadcasts, videos are sorted by number of concurrent viewers while the broadcasts are ongoing.
            case viewCount = "viewCount"
        }
    }
    
    enum YoutubeKey: String
    {
        case kind = "kind"
        case etag = "etag"
        case nextPageToken = "nextPageToken"
        case regionCode = "regionCode"
        case pageInfo = "pageInfo"
        case items = "items"
        
        enum PageInfo: String {
            case totalResults = "totalResults"
            case resultsPerPage = "resultsPerPage"
        }
        
        enum Items: String {
            case kind = "kind"
            case etag = "etag"
            case id = "id"
            case snippet = "snippet"
            
            enum Id: String {
                case kind = "kind"
                case videoId = "videoId"
            }
            
            enum Snippet: String {
                case publishedAt = "publishedAt"
                case channelId = "channelId"
                case title = "title"
                case description = "description"
                case thumbnails = "thumbnails"
                case channelTitle = "channelTitle"
                case liveBroadcastContent = "liveBroadcastContent"
                
                enum Thumbnails: String {
                    case t_default = "default"
                    case medium = "medium"
                    case high = "high"
                    
                    //T_default 120,90
                    enum T_default: String {
                        case url = "url"
                        case width = "width"
                        case height = "height"
                    }
                    //T_medium 320,180
                    enum T_medium: String {
                        case url = "url"
                        case width = "width"
                        case height = "height"
                    }
                    //T_medium 480,360
                    enum T_high: String {
                        case url = "url"
                        case width = "width"
                        case height = "height"
                    }
                }
            }
        }
    }
}
