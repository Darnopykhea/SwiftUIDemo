//
//  MultipleSelectInput.swift
//  
//
//  Created by Евгений Дарнопых on 16.05.2025.
//

import Foundation

/// Входные данные экрана Множественного выбора
public struct MultipleSelectInput {
    public let title: String
    public let headers: [MultipleSelectEntryContainerHeader]
    public let onApplySelection: (([MultipleSelectEntryHeader]) -> Void)?

    public init(
        title: String,
        headers: [MultipleSelectEntryContainerHeader],
        onApplySelection: (([MultipleSelectEntryHeader]) -> Void)?
    ) {
        self.title = title
        self.headers = headers
        self.onApplySelection = onApplySelection
    }
}
