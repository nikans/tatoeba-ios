//
//  ContributionsRequest.swift
//  Tatoeba
//
//  Created by Jack Cook on 8/6/17.
//  Copyright © 2017 Tatoeba. All rights reserved.
//

import Alamofire
import SwiftyJSON

/// Returns recent contributions using the specified parameters.
final class ContributionsRequest: TatoebaRequest {
    
    typealias ResponseData = JSON
    typealias Value = [Contribution]
    
    var endpoint: String {
        return "/contributions"
    }
    
    var parameters: Parameters {
        return [String: String]()
    }
    
    var responseType: TatoebaResponseType {
        return .json
    }
    
    func handleRequest(_ json: JSON?, _ completion: @escaping ([Contribution]?) -> Void) {
        guard let contributionData = json?.array else {
            completion(nil)
            return
        }
        
        var contributions = [Contribution]()
        
        for contributionDatum in contributionData {
            let contribution = Contribution(json: contributionDatum)
            contributions.append(contribution)
        }
        
        completion(contributions)
    }
}
