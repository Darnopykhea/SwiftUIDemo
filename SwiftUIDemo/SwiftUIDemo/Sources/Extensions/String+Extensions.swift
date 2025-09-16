//
//  String+Extensions.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import Foundation

// MARK: - String helpers
extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool { self?.isEmpty ?? true }
    var isNilOrBlank: Bool { self?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true }
}
extension String { var isBlank: Bool { trimmingCharacters(in: .whitespacesAndNewlines).isEmpty } }

// SwiftUI helper to dismiss keyboard (если используешь)
#if canImport(UIKit)
import SwiftUI
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
