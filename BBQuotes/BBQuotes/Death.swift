//
//  Death.swift
//  BBQuotes
//
//  Created by Arya Mirsepasi on 15.12.25.
//
import Foundation

struct Death: Decodable {
    let character: String
    let image: URL
    let cause: String
    let details: String
    let responsible: [String]
    let connected: [String]
    let last_words: String
    let episode: Int
    let production: String
}

