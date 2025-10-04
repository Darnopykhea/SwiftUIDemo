//
//  MultipleSelectViewModel.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import Foundation
import Combine

public final class MultipleSelectViewModel: ObservableObject {

    public var onApplySelection: (([MultipleSelectEntryContainerHeader]) -> Void)?

    @Published public var state: MultipleSelectState = .nonSelected
    @Published public var sections: [MultipleSelectEntryContainerHeader] = []
    @Published public var hasSelectedEntries = false
    @Published public var filterText: String? {
        didSet {
            let text = filterText ?? ""
            sections.forEach { $0.filterRows(text) }
        }
    }

    @Published public var isCancelButtonTapped = false

    private var bag = Set<AnyCancellable>()

    public init(input: MultipleSelectInput) {
        self.sections = input.headers
        observeSectionStates()
        // начальная синхронизация
        recomputeAggregates()
    }

    // MARK: - Actions

    public func unselectRows() {
        sections.forEach { $0.setSelectedForRows(false) }
    }

    public func selectUnselectRows() {
        if (filterText ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let allSelected = sections.allSatisfy { $0.state == .selected }
            sections.forEach { $0.setSelectedForAllRows(!allSelected) } // ← вместо setSelectedForRows
        } else {
            let filtered = sections.filter { !$0.filteredRows.isEmpty }
            let allVisibleSelected = filtered.allSatisfy { $0.filteredRows.allSatisfy { $0.isSelected } }
            filtered.forEach { $0.setSelectedForRows(!allVisibleSelected) }
        }
    }

    public func performCancelButtonAction() {
        isCancelButtonTapped.toggle()
    }

    public func handleApply() {
        let selectedSections = sections.compactMap { section -> MultipleSelectEntryContainerHeader? in
            let selected = section.entries.filter { $0.isSelected }
            guard !selected.isEmpty else { return nil }
            return MultipleSelectEntryContainerHeader(name: section.name, additionalInfo: section.additionalInfo, entries: selected)
        }
        onApplySelection?(selectedSections)
    }

    // MARK: - Private

    private func observeSectionStates() {
        bag.removeAll()
        // реакция на изменения state в любой секции
        Publishers.MergeMany(sections.map { $0.$state })
            .sink { [weak self] _ in self?.recomputeAggregates() }
            .store(in: &bag)
    }

    private func recomputeAggregates() {
        let states = sections.map(\.state)
        let allSelected = states.allSatisfy { $0 == .selected }
        let allUnselected = states.allSatisfy { $0 == .nonSelected }

        state = allSelected ? .selected : (allUnselected ? .nonSelected : .partlySelected)
        hasSelectedEntries = states.contains { $0 != .nonSelected }
    }
}
