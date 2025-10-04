//
//  HubView.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import SwiftUI

private enum Route: Hashable {
    case animals // Multiple Select
}

public struct HubView: View {
    @State private var path: [Route] = []
    @State private var showAlert = false
    @State private var alertText = ""

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Демки") {
                    multipleSelectButton()
                }
            }
            .navigationTitle("SwiftUI Demos")

            // простой алерт
            .alert("Выбрано", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertText.isEmpty ? "Ничего не выбрано" : alertText)
            }

            .navigationDestination(for: Route.self) { route in
                switch route {
                case .animals:
                    // Колбэк теперь поднимает алерт вместо пуша summary
                    let input = MultipleSelectMockData.animalsInput { selected in
                        let names = selected
                            .flatMap { $0.entries }
                            .map { $0.title }

                        alertText = names.isEmpty
                            ? "Ничего не выбрано"
                            : names.joined(separator: ", ")

                        showAlert = true
                    }

                    MultipleSelectFactory(input: input)
                        .makeObject()
                        .navigationTitle(input.title)
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
}
