//
//  Validator.swift
//  
//
//  Created by tokizo on 2023/03/17.
//

struct Validator {
    static func validate(_ statusChecks: [StatusCheck]) -> [StatusCheck] {
        // TODO: pending
        statusChecks
            .filter { statusCheck in
                statusCheck.state != .success
            }
    }
}
