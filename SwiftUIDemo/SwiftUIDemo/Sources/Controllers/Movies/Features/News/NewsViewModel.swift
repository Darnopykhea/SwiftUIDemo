//
//  NewsViewModel.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 10/4/25.
//

import Foundation
import SwiftUI
import UIKit

enum NewsViewModelState {
    case isLoading
    case loaded(items: [NewsViewCellModel])
}

@MainActor
final class NewsViewModel: ObservableObject {
    @Published var items: [NewsViewCellModel] = []
    @Published var state: NewsViewModelState = .isLoading
    
    private let service: ContentService
    
    init(service: ContentService) {
        self.service = service
    }
    
    func load(query: String? = nil) async {
        state = .isLoading
        do {
            // Небольшая имитация задержки сети (по желанию можно убрать)
            try? await Task.sleep(nanoseconds: 400_000_000)
            
            let news = try await service.fetchNews(query: query)
            let images = try await loadImages(urls: news.map { $0.image })
            let models = news.map { item in
                let dateText = item.date.formatted(date: .abbreviated, time: .shortened)
                return NewsViewCellModel(
                    title: item.title,
                    subtitle: dateText
                )
            }
            
            for (index, image) in images.enumerated() {
                models[index].image = image
            }
            
            state = .loaded(items: models)
        } catch {
            // На демо просто показываем пустой список
            state = .loaded(items: [])
        }
    }
    
    func loadImages(urls: [URL]) async throws -> [UIImage] {
        try await withThrowingTaskGroup(
            of: (Int, UIImage?).self,
            returning: [UIImage].self
        ) { group in
            var result = Array<UIImage?>(repeating: nil, count: urls.count)

            for (index, url) in urls.enumerated() {                
                group.addTask {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    return (index, UIImage.init(data: data))
                }
            }
            
            while let child = try await group.next() {
                result[child.0] = child.1
            }
            
            return result.compactMap { $0 }
        }
    }
}
