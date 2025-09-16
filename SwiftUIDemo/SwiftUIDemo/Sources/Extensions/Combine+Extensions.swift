//
//  Combine+Extensions.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import Combine

extension Collection where Element: Publisher {
    /// CombineLatest для коллекции паблишеров.
    /// - Порядок в массиве соответствует порядку в коллекции.
    /// - Пустая коллекция → немедленно публикует [].
    func combineLatest() -> AnyPublisher<[Element.Output], Element.Failure> {
        guard let first = self.first else {
            return Just([]).setFailureType(to: Element.Failure.self).eraseToAnyPublisher()
        }
        // Начинаем с первого → превращаем его в массив из одного элемента
        let initial = first.map { [$0] }.eraseToAnyPublisher()

        // Последовательно «приклеиваем» остальные через combineLatest
        return dropFirst().reduce(initial) { acc, pub in
            acc.combineLatest(pub)
                .map { arr, value in arr + [value] }
                .eraseToAnyPublisher()
        }
    }
}
