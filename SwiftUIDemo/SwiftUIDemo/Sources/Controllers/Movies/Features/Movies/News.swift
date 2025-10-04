//
//  News.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 10/4/25.
//

import Foundation

public struct News: Codable, Identifiable, Hashable {
    public let id: String
    public let title: String
    public let image: URL
    public let date: Date
    public let text: String
    public let link: URL?
}
