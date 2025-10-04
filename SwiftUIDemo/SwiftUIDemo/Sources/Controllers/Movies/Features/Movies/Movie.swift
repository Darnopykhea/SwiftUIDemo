//
//  Movie.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 10/4/25.
//

import Foundation

public struct Movie: Codable, Identifiable, Hashable {
    public let id: String
    public let title: String
    public let poster: URL
    public let overview: String
}

