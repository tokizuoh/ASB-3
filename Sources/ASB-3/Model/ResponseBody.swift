//
//  ResponseBody.swift
//
//
//  Created by tokizo on 2023/03/17.
//

// https://docs.github.com/ja/graphql/reference/queries#repository
struct ResponseBody: Codable {
    struct Data: Codable {
        struct Repository: Codable {
            struct Object: Codable {
                struct StatusCheckRollup: Codable {
                    struct Contexts: Codable {
                        struct Node: Codable {
                            let conclusion: String?
                            let detailsUrl: String?
                            let name: String?
                            let state: String?
                            let targetUrl: String?
                            let context: String?
                        }
                        let nodes: [Node]
                    }
                    let contexts: Contexts
                }
                let statusCheckRollup: StatusCheckRollup
            }
            let object: Object
        }
        let repository: Repository
    }
    let data: Data
}

extension ResponseBody.Data.Repository.Object.StatusCheckRollup.Contexts.Node {
    struct CheckRun {
        let conclusion: String
        let detailsUrl: String
        let name: String
    }
    
    func asCheckRun() -> CheckRun? {
        guard let conclusion,
              let detailsUrl,
              let name else {
            return nil
        }
        
        return CheckRun(
            conclusion: conclusion,
            detailsUrl: detailsUrl,
            name: name
        )
    }
    
    struct StatusContext {
        let state: String
        let targetUrl: String
        let context: String
    }
    
    func asStatusContext() -> StatusContext? {
        guard let state,
              let targetUrl,
              let context else {
            return nil
        }
        
        return StatusContext(
            state: state,
            targetUrl: targetUrl,
            context: context
        )
    }
}

