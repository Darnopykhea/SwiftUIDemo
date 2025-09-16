//
//  MultipleSelectModels.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import Foundation
import Combine

// MARK: - State

public enum MultipleSelectState {
    case selected
    case partlySelected
    case nonSelected
}

// MARK: - Entry

public final class MultipleSelectEntry: ObservableObject, Identifiable {
    @Published public var isSelected: Bool
    public let id: UUID = .init()
    public let title: String
    public let subtitle: String
    public let additionalText: String?

    public init(
        name: String,
        subtitle: String,
        additionalText: String? = nil,
        isSelected: Bool = false
    ) {
        self.title = name
        self.subtitle = subtitle
        self.additionalText = additionalText
        self.isSelected = isSelected
    }
}

// MARK: - Section header protocol

public protocol MultipleSelectEntryHeader {
    var name: String? { get }
    var additionalInfo: String? { get }
    var entries: [MultipleSelectEntry] { get }
}

// MARK: - Section (container)

public final class MultipleSelectEntryContainerHeader: MultipleSelectEntryHeader, ObservableObject, Identifiable {
    @Published public var state: MultipleSelectState = .nonSelected
    @Published public var filteredRows: [MultipleSelectEntry] = []

    public let id: UUID = .init()
    public let name: String?
    public let additionalInfo: String?
    public let entries: [MultipleSelectEntry]

    private var cancellables = Set<AnyCancellable>()

    public init(
        name: String? = nil,
        additionalInfo: String? = nil,
        entries: [MultipleSelectEntry]
    ) {
        self.name = name
        self.additionalInfo = additionalInfo
        self.entries = entries
        self.filteredRows = entries

        observeRowsSelectionChanges()
        recomputeState()
    }

    public func filterRows(_ text: String) {
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            filteredRows = entries
        } else {
            let needle = text.lowercased()
            filteredRows = entries.filter {
                $0.title.lowercased().contains(needle)
                || $0.subtitle.lowercased().contains(needle)
            }
        }
        // Важно: состояние зависит от ВСЕХ entries, а не от filteredRows
        recomputeState()
    }

    /// Выделяет/снимает выделение у всех строк в **filteredRows**
    public func selectUnselectRows() {
        let allSelected = filteredRows.allSatisfy { $0.isSelected }
        setSelectedForRows(!allSelected)
    }

    public func setSelectedForRows(_ isSelected: Bool) {
        filteredRows.forEach { $0.isSelected = isSelected }
    }

    // MARK: - Private

    private func observeRowsSelectionChanges() {
        cancellables.removeAll()
        entries.forEach { entry in
            entry.$isSelected
                .sink { [weak self] _ in self?.recomputeState() }
                .store(in: &cancellables)
        }
    }

    private func recomputeState() {
        let total = entries.count
        let selected = entries.filter { $0.isSelected }.count
        state = selected == 0 ? .nonSelected : (selected == total ? .selected : .partlySelected)
    }
}
