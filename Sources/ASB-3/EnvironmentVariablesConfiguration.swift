//
//  EnvironmentVariablesConfiguration.swift
//
//
//  Created by tokizo on 2023/03/17.
//

import Foundation

enum EnvironmentVariablesConfiguration {
    static func setUp() throws {
        #if DEBUG
        do {
            let name = try getEnvironmentVaiable(by: "CITRUS_NAME")
            let owner = try getEnvironmentVaiable(by: "CITRUS_OWNER")
            let expression = try getEnvironmentVaiable(by: "CITRUS_EXPRESSION")
            let token = try getEnvironmentVaiable(by: "CITRUS_BEARER_TOKEN")
            
            EnvironmentVariable.name = name
            EnvironmentVariable.owner = owner
            EnvironmentVariable.expression = expression
            EnvironmentVariable.token = token
        } catch {
            throw error
        }
        #else
        do {
            let gitHubRepository = try getEnvironmentVaiable(by: "GITHUB_REPOSITORY")
            let expression = try getEnvironmentVaiable(by: "GITHUB_SHA")
            let token = try getEnvironmentVaiable(by: "GITHUB_TOKEN")
            
            let nameAndOwner = gitHubRepository.components(separatedBy: "/")
            let name = nameAndOwner[0]
            let owner = nameAndOwner[1]
            EnvironmentVariable.name = name
            EnvironmentVariable.owner = owner
            EnvironmentVariable.expression = expression
            EnvironmentVariable.token = token
        } catch {
            throw error
        }
        #endif
    }
    
    private static func getEnvironmentVaiable(by name: String) throws -> String {
        guard let environmentVariable =  ProcessInfo.processInfo.environment[name] else {
            throw CitrusError.noSuchEnvironmentVariable(name)
        }
        
        return environmentVariable
    }
}
