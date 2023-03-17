//
//  CitrusError.swift
//
//
//  Created by tokizo on 2023/03/17.
//
enum CitrusError: Error {
    case noSuchEnvironmentVariable(String)
    case httpResponseError(String)
}
