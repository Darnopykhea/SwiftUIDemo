//
//  NewsView.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 10/4/25.
//

import SwiftUI

// Экран новости
struct NewsView: View {
    @StateObject var viewModel: NewsViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: 200, height: 200)
                    .tint(.purple)
            case .loaded(let items):
                ScrollView {
                    LazyVStack {
                        ForEach(items) { item in
                            NewsViewCell(viewModel: item)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.load()
        }
    }
}


// MARK: - Cell

struct NewsViewCell: View {
    @ObservedObject var viewModel: NewsViewCellModel

    var body: some View {
        HStack(alignment: .center, spacing: 32) {
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)

            VStack(alignment: .trailing, spacing: 6) {
                Text(viewModel.title)
                    .foregroundStyle(.cyan)
                    .font(.headline)
                    .multilineTextAlignment(.trailing)

                Text(viewModel.subtitle)
                    .font(.caption)
                    .multilineTextAlignment(.trailing)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.vertical, 8)
    }
}


final class NewsViewCellModel: ObservableObject, Identifiable {
    var image: UIImage?
    let title: String
    let subtitle: String
    let id = UUID()
    
    init(image: UIImage? = nil, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}









