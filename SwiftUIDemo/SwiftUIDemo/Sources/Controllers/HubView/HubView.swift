//
//  HubView.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import SwiftUI

private enum Route: Hashable {
    case profile
    case animals // Multiple Select
    case summary([String]) // имена выбранных
}

public struct HubView: View {
    @State private var path: [Route] = []

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Демки") {
                    multipleSelectButton()
                    profileCard()
                }
            }
            .navigationTitle("SwiftUI Demos")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .animals:
                    let input = MultipleSelectMockData.animalsInput { selected in
                        let names = selected.flatMap { $0.entries }.map { $0.title }
                        path.append(.summary(names))
                    }
                    MultipleSelectFactory(input: input).makeObject()
                        .navigationTitle(input.title)
                        .navigationBarTitleDisplayMode(.inline)

                case .summary(let names):
                    SelectionSummaryView(items: names) {
                        path.removeAll()
                    }
                    .navigationTitle("Выбрано")
                    .navigationBarTitleDisplayMode(.inline)
                case .profile:
                    Profile()
                        .navigationTitle("Профиль пользователя")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

extension HubView {
    func multipleSelectButton() -> some View {
        Button {
            path.append(.animals)
        } label: {
            VStack(alignment: .leading, spacing: 4) {
                Text("Животные (Multiple Select)")
                    .font(.headline)
                    .foregroundStyle(.black)
                Text("Домашние, дикие, морские, птицы")
                    .font(.caption)
                    .foregroundStyle(.black)
            }
        }
    }
    
    func profileCard() -> some View {
        Button {
            path.append(.profile)
        } label: {
            Text("Карточка пользователя")
                .font(.headline)
                .foregroundStyle(.black)
        }
    }
}
