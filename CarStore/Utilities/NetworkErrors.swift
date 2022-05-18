//
//  NetworkErrors.swift
//  CarStore
//
//  Created by Seydali Seydametov.
//  Copyright © 2022 Seydali Seydametov. All rights reserved.
//

import Foundation

enum NetworkError : String {
    case URL_ERROR = "URL error"
    case HTTP_ERROR = "HTTP error"
    case NETWORK_REQUEST_FAILED = "Network request failed"
    case BAD_RESPONSE = "Bad/invalid response"
}
