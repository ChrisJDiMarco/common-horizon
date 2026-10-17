import Foundation
import SwiftUI

enum SourceKind: String, CaseIterable, Hashable {
    case book = "Book"
    case article = "Article"
    case report = "Report"
    case reference = "Reference"
}

struct Source: Identifiable, Hashable {
    let id: String
    let title: String
    let author: String
    let year: String
    let publisher: String
    let kind: SourceKind
    let urlString: String
    let note: String

    var url: URL {
        URL(string: urlString)!
    }
}

struct ArgumentCard: Identifiable, Hashable {
    let id: String
    let lens: String
    let thesis: String
    let body: String
    let whatChanges: String
    let imageName: String
    let sourceIds: [String]
    let symbol: String
    let tint: Color
}

struct EvidenceStat: Identifiable, Hashable {
    let id: String
    let value: String
    let label: String
    let context: String
    let category: String
    let sourceIds: [String]
    let symbol: String
    let tint: Color
}

struct Framework: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let principles: [String]
    let practice: String
    let sourceIds: [String]
    let symbol: String
    let tint: Color
}

struct Story: Identifiable, Hashable {
    let id: String
    let title: String
    let period: String
    let summary: String
    let takeaway: String
    let sourceIds: [String]
    let symbol: String
    let tint: Color
}

struct FutureScenario: Identifiable, Hashable {
    let id: String
    let title: String
    let premise: String
    let world: String
    let sourceIds: [String]
    let symbol: String
    let tint: Color
}

struct MediaFeature: Identifiable, Hashable {
    let id: String
    let kicker: String
    let title: String
    let body: String
    let imageName: String
    let videoName: String?
    let runtime: String
    let sourceIds: [String]
    let symbol: String
    let tint: Color
}

struct GlossaryTerm: Identifiable, Hashable {
    let id: String
    let term: String
    let definition: String
    let sourceIds: [String]
}

struct HardQuestion: Identifiable, Hashable {
    let id: String
    let question: String
    let answer: String
    let sourceIds: [String]
}

struct SavedItem: Identifiable, Hashable {
    let id: String
    let kind: String
    let title: String
    let subtitle: String
    let symbol: String
    let tint: Color
}

enum HorizonDataIssue: String, Error {
    case missingSources
    case invalidSourceReference
    case invalidURL
}
