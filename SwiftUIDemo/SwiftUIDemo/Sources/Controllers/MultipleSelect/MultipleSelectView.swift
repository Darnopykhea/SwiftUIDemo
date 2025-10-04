//
//  MultipleSelectView.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import SwiftUI

public struct MultipleSelectView: View {

    @StateObject private var viewModel: MultipleSelectViewModel
    @Environment(\.dismiss) private var dismiss
    
    public init(viewModel: MultipleSelectViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                headerView()
                Divider()
                    .padding(.bottom, 8)
                
                ForEach(viewModel.sections) { section in
                    if !section.filteredRows.isEmpty {
                        SectionView(section: section, showHeader: true)
                    }
                }
            }
            .padding(.bottom, 76)
        }
        .safeAreaInset(edge: .top) { searchBar() }
        .overlay(alignment: .bottom) { applyButtonBar() }
        .ignoresSafeArea(.keyboard)
        .gesture(DragGesture().onChanged { _ in hideKeyboard() })
    }

    // MARK: - Pieces

    private func headerView() -> some View {
        MultipleSelectHeaderView(
            title: "Select All",
            additionalInfo: nil,
            isResetButtonHidden: !viewModel.hasSelectedEntries,
            state: viewModel.state,
            onTap: { viewModel.selectUnselectRows() },
            onReset: { viewModel.unselectRows() }
        )
    }

    private func searchBar() -> some View {
        HStack(spacing: 8) {
            TextField("Search", text: Binding(
                get: { viewModel.filterText ?? "" },
                set: { viewModel.filterText = $0 }
            ))
            .textFieldStyle(.roundedBorder)

            if shouldShowCancel {
                Button("Cancel") {
                    viewModel.filterText = ""
                    viewModel.isCancelButtonTapped = true
                    hideKeyboard()
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.thinMaterial)
    }

    private var shouldShowCancel: Bool {
        let hasSelected = viewModel.hasSelectedEntries
        let hasText = !(viewModel.filterText.isNilOrEmpty)
        return (hasSelected || hasText) && !viewModel.isCancelButtonTapped
    }

    private func applyButtonBar() -> some View {
        VStack {
            Button("Apply") {
                viewModel.handleApply()
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity)
        .background(Material.bar)
    }
}

// MARK: - Section & Row

private struct SectionView: View {
    @ObservedObject var section: MultipleSelectEntryContainerHeader
    let showHeader: Bool

    var body: some View {
        if showHeader {
            MultipleSelectHeaderView(
                title: section.name ?? "",
                additionalInfo: section.additionalInfo,
                isResetButtonHidden: section.state == .nonSelected,
                state: section.state,
                onTap: { section.selectUnselectRows() },
                onReset: { section.setSelectedForAllRows(false) }
            )

        }
        ForEach(section.filteredRows) { row in
            RowView(row: row)
        }
    }
}

private struct RowView: View {
    @ObservedObject var row: MultipleSelectEntry
    var body: some View {
        Button {
            row.isSelected.toggle()
        } label: {
            HStack(alignment: .firstTextBaseline, spacing: 12) {
                Image(systemName: row.isSelected ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.tint)

                VStack(alignment: .leading, spacing: 2) {
                    Text(row.title)
                        .font(.body)
                    if !row.subtitle.isEmpty {
                        Text(row.subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                if let add = row.additionalText, !add.isEmpty {
                    Text(add)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .contentShape(Rectangle())
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
    }
}
