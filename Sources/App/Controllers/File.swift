//
//  File.swift
//  
//
//  Created by Xiang Maxine on 22/6/2022.
//

import Foundation
import Vapor

enum Status: String, Codable {
    case ok = "ok"
    case error = "error"
}

struct HealthContent: Content {
    var status: Status
    var total: Int
    var numHealthyServices: Int
    var isLeaf: Bool
    var services: [HealthContent]
}

struct Health: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("health", use: self.get)
    }
    
    func get(req: Request) throws -> HealthContent {
        return HealthContent(status: .ok, total:1, numHealthyServices:1, isLeaf: false, services:[]
        )
    }
    
}
