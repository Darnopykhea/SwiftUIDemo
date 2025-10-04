//
//  ContentService.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 10/4/25.
//

import Foundation

public protocol ContentService {
    func fetchNews(query: String?) async throws -> [News]
    func fetchMovies(query: String?) async throws -> [Movie]
}

public final class MockLocalContentService: ContentService {

    private let decoder: JSONDecoder = {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .iso8601
        return d
    }()

    public init() {}

    public func fetchNews(query: String?) async throws -> [News] {
        try Task.checkCancellation()
        let data = Data(Self.newsJSON.utf8)
        var items = try decoder.decode([News].self, from: data)
        if let q = query?.trimmingCharacters(in: .whitespacesAndNewlines), !q.isEmpty {
            let needle = q.lowercased()
            items = items.filter { $0.title.lowercased().contains(needle) }
        }
        return items
    }

    public func fetchMovies(query: String?) async throws -> [Movie] {
        try Task.checkCancellation()
        let data = Data(Self.moviesJSON.utf8)
        var items = try decoder.decode([Movie].self, from: data)
        if let q = query?.trimmingCharacters(in: .whitespacesAndNewlines), !q.isEmpty {
            let needle = q.lowercased()
            items = items.filter { $0.title.lowercased().contains(needle) }
        }
        return items
    }
}
