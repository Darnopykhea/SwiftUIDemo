//
//  MultipleSelectHeaderView.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import SwiftUI

public struct MultipleSelectHeaderView: View {
    public let title: String
    public let additionalInfo: String?
    public let isResetButtonHidden: Bool
    public let state: MultipleSelectState
    public var onTap: () -> Void = {}
    public var onReset: () -> Void = {}

    public init(
        title: String,
        additionalInfo: String? = nil,
        isResetButtonHidden: Bool = true,
        state: MultipleSelectState = .nonSelected,
        onTap: @escaping () -> Void = {},
        onReset: @escaping () -> Void = {}
    ) {
        self.title = title
        self.additionalInfo = additionalInfo
        self.isResetButtonHidden = isResetButtonHidden
        self.state = state
        self.onTap = onTap
        self.onReset = onReset
    }

    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: symbolName)
                .imageScale(.large)
                .frame(width: 24, height: 24)
                .foregroundStyle(.tint)

            Text(title)
                .font(.body)
                .lineLimit(1)

            Spacer(minLength: 8)

            if let info = additionalInfo, !info.isEmpty {
                Text(info)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            if !isResetButtonHidden {
                Button("Reset", action: onReset).font(.callout)
            }
        }
        .padding(.horizontal)
        .frame(height: 49)
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title), \(a11yState)")
    }

    private var symbolName: String {
        switch state {
        case .selected:       return "checkmark.square.fill"
        case .partlySelected: return "minus.square.fill"
        case .nonSelected:    return "square"
        }
    }
    private var a11yState: String {
        switch state {
        case .selected: "selected"
        case .partlySelected: "partially selected"
        case .nonSelected: "not selected"
        }
    }
}
