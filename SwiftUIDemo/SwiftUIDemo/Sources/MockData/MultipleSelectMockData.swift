//
//  MultipleSelectInput.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/16/25.
//

import Foundation

enum MultipleSelectMockData {
    static func animalsInput(onApply: @escaping ([MultipleSelectEntryHeader]) -> Void) -> MultipleSelectInput {

        func section(_ name: String, _ items: [(String, String, String?)]) -> MultipleSelectEntryContainerHeader {
            let entries = items.map { MultipleSelectEntry(name: $0.0, subtitle: $0.1, additionalText: $0.2) }
            return MultipleSelectEntryContainerHeader(name: name, additionalInfo: nil, entries: entries)
        }

        let pets = section("Домашние", [
            ("Кошка",   "Домашние", "😺"),
            ("Собака",  "Домашние", "🐶"),
            ("Хомяк",   "Домашние", "🐹"),
            ("Кролик",  "Домашние", "🐰"),
            ("Курица",  "Домашние", "🐔"),
        ])

        let wild = section("Дикие", [
            ("Лев",     "Дикие", "🦁"),
            ("Тигр",    "Дикие", "🐯"),
            ("Медведь", "Дикие", "🐻"),
            ("Лиса",    "Дикие", "🦊"),
            ("Волк",    "Дикие", "🐺"),
        ])

        let sea = section("Морские", [
            ("Дельфин",      "Морские", "🐬"),
            ("Кит",          "Морские", "🐋"),
            ("Акула",        "Морские", "🦈"),
            ("Осьминог",     "Морские", "🐙"),
            ("Морской конёк","Морские", "🐠"),
        ])

        let birds = section("Птицы", [
            ("Орёл",    "Птицы", "🦅"),
            ("Сокол",   "Птицы", "🦅"),
            ("Пингвин", "Птицы", "🐧"),
            ("Попугай", "Птицы", "🦜"),
            ("Сова",    "Птицы", "🦉"),
        ])

        return MultipleSelectInput(
            title: "Животные",
            headers: [pets, wild, sea, birds],
            onApplySelection: onApply
        )
    }
}
