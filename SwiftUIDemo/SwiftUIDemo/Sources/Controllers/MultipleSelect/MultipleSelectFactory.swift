//
//  MultipleSelectFactory.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import SwiftUI

public struct MultipleSelectFactory {

    let input: MultipleSelectInput

    public init(input: MultipleSelectInput) {
        self.input = input
    }

    public func makeObject() -> some View {
        let vm = MultipleSelectViewModel(input: input)
        vm.onApplySelection = input.onApplySelection
        return MultipleSelectView(viewModel: vm)
    }
}
