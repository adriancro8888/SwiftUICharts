//
//  Bar.swift
//  CardioBot
//
//  Created by Majid Jabrayilov on 5/13/20.
//  Copyright © 2020 Majid Jabrayilov. All rights reserved.
//
import SwiftUI

public struct Legend {
    let color: Color
    let label: LocalizedStringKey
    let order: Int

    public init(color: Color, label: LocalizedStringKey, order: Int = 0) {
        self.color = color
        self.label = label
        self.order = order
    }
}

extension Legend: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.order < rhs.order
    }
}

extension Legend: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(color)
    }
}

public struct Bar {
    let value: Double
    let label: LocalizedStringKey
    let legend: Legend
    let visible: Bool

    public init(value: Double, label: LocalizedStringKey, legend: Legend, visible: Bool = true) {
        self.value = value
        self.label = label
        self.legend = legend
        self.visible = visible
    }
}

extension Bar: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(legend)
        hasher.combine(value)
    }
}

extension Bar: Comparable {
    public static func < (lhs: Bar, rhs: Bar) -> Bool {
        lhs.value < rhs.value
    }
}

#if DEBUG
extension Bar {
    static var mock: [Bar] {
        let highIntensity = Legend(color: .orange, label: "High Intensity", order: 5)
        let buildFitness = Legend(color: .yellow, label: "Build Fitness", order: 4)
        let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
        let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
        let low = Legend(color: .gray, label: "Low", order: 1)

        return [
            .init(value: 70, label: "1", legend: low),
            .init(value: 90, label: "2", legend: warmUp),
            .init(value: 91, label: "3", legend: warmUp),
            .init(value: 92, label: "4", legend: warmUp),
            .init(value: 130, label: "5", legend: fatBurning),
            .init(value: 124, label: "6", legend: fatBurning),
            .init(value: 135, label: "7", legend: fatBurning),
            .init(value: 133, label: "8", legend: fatBurning),
            .init(value: 136, label: "9", legend: fatBurning),
            .init(value: 138, label: "10", legend: fatBurning),
            .init(value: 150, label: "11", legend: buildFitness),
            .init(value: 151, label: "12", legend: buildFitness),
            .init(value: 150, label: "13", legend: buildFitness),
            .init(value: 136, label: "14", legend: fatBurning),
            .init(value: 135, label: "15", legend: fatBurning),
            .init(value: 130, label: "16", legend: fatBurning),
            .init(value: 130, label: "17", legend: fatBurning),
            .init(value: 150, label: "18", legend: buildFitness),
            .init(value: 151, label: "19", legend: buildFitness),
            .init(value: 150, label: "20", legend: buildFitness),
            .init(value: 160, label: "21", legend: highIntensity),
            .init(value: 159, label: "22", legend: highIntensity),
            .init(value: 161, label: "23", legend: highIntensity),
            .init(value: 158, label: "24", legend: highIntensity),
        ]
    }
}
#endif
