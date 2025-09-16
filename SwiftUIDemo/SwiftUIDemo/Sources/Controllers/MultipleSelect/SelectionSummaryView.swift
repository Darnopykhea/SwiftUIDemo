//
//  SelectionSummaryView.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import SwiftUI

struct SelectionSummaryView: View {
    let items: [String]
    var onClose: () -> Void = {}

    var body: some View {
        VStack(spacing: 12) {
            if items.isEmpty {
                ContentUnavailableView("Ничего не выбрано", systemImage: "square.dashed",
                                       description: Text("Вернись и отметь хотя бы один пункт."))
                    .padding(.top, 20)
            } else {
                List(items, id: \.self) { name in
                    Label(name, systemImage: "checkmark.circle.fill")
                }
            }

            Button {
                onClose()
            } label: {
                Text(items.isEmpty ? "На главную" : "Готово")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}
