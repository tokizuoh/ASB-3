//
//  StatusCheck.swift
//
//
//  Created by tokizo on 2023/03/17.
//
import Foundation

struct StatusCheck {
    enum State {
        // StatusState
        case success
        case failure
        case pending
        case error
        case expected
        
        // CheckConclusionState
        case actionRequired
        case cancelled
        case neutral
        case skipped
        case stale
        case startupFailure
        case timedOut
        
        static func convertState(from: String) -> State? {
            switch from {
            case "SUCCESS":
                return .success
            case "FAILURE":
                return .failure
            case "PENDING":
                return .pending
            case "ERROR":
                return .error
            case "EXPECTED":
                return.expected
            case "ACTION_REQUIRED":
                return .actionRequired
            case "CENCELLED":
                return .cancelled
            case "NEUTRAL":
                return .neutral
            case "SKIPPED":
                return .skipped
            case "STALE":
                return .stale
            case "STARTUP_FAILURE":
                return .startupFailure
            case "TIMED_OUT":
                return .timedOut
            default:
                return nil
            }
        }
    }
    
    let name: String
    let state: State
    let url: URL?
}
