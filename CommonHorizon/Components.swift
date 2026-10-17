import AVKit
import SwiftUI
import UIKit

enum HorizonTheme {
    static let cardRadius: CGFloat = 8
    static let softLine = Color.secondary.opacity(0.16)
    static let surface = Color(uiColor: .secondarySystemGroupedBackground)
    static let background = Color(uiColor: .systemGroupedBackground)
}

private let savedStorageKey = "commonHorizonSavedIDs"

private func savedIDSet(from rawValue: String) -> Set<String> {
    Set(rawValue.split(separator: ",").map(String.init))
}

struct SectionHeader: View {
    let title: String
    let subtitle: String?

    init(_ title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.title2.bold())
            if let subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
    }
}

struct FramedBlock<Content: View>: View {
    let padding: CGFloat
    @ViewBuilder let content: Content

    init(padding: CGFloat = 16, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.content = content()
    }

    var body: some View {
        content
            .padding(padding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(HorizonTheme.surface)
            .clipShape(RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous)
                    .stroke(HorizonTheme.softLine, lineWidth: 1)
            }
    }
}

struct PillLabel: View {
    let title: String
    let systemImage: String
    let tint: Color

    var body: some View {
        Label(title, systemImage: systemImage)
            .font(.caption.weight(.bold))
            .foregroundStyle(tint)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(tint.opacity(0.12), in: Capsule())
            .accessibilityElement(children: .combine)
    }
}

struct ChapterHero: View {
    let imageName: String
    let kicker: String
    let title: String
    let subtitle: String
    let tint: Color
    let symbol: String

    var body: some View {
        FramedBlock(padding: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HorizonImage(name: imageName, height: 220)
                VStack(alignment: .leading, spacing: 12) {
                    PillLabel(title: kicker, systemImage: symbol, tint: tint)
                    Text(title)
                        .font(.largeTitle.bold())
                        .fixedSize(horizontal: false, vertical: true)
                    Text(subtitle)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding(16)
            }
        }
    }
}

struct HorizonImage: View {
    let name: String
    let height: CGFloat

    var body: some View {
        if let url = Bundle.main.url(forResource: name, withExtension: "png"),
           let image = UIImage(contentsOfFile: url.path) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .clipped()
                .accessibilityHidden(true)
        } else {
            ZStack {
                Rectangle()
                    .fill(Color.secondary.opacity(0.12))
                Image(systemName: "photo")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .accessibilityLabel("Image unavailable")
        }
    }
}

struct SaveButton: View {
    let id: String
    @AppStorage(savedStorageKey) private var savedRawValue = ""

    private var isSaved: Bool {
        savedIDSet(from: savedRawValue).contains(id)
    }

    var body: some View {
        Button {
            var ids = savedIDSet(from: savedRawValue)
            if isSaved {
                ids.remove(id)
            } else {
                ids.insert(id)
            }
            savedRawValue = ids.sorted().joined(separator: ",")
        } label: {
            Label(isSaved ? "Saved" : "Save", systemImage: isSaved ? "bookmark.fill" : "bookmark")
        }
        .buttonStyle(.bordered)
        .controlSize(.small)
        .accessibilityHint(isSaved ? "Removes this item from your saved library" : "Adds this item to your saved library")
    }
}

struct ActionRow: View {
    let id: String
    let shareText: String

    var body: some View {
        HStack(spacing: 10) {
            SaveButton(id: id)
            ShareLink(item: shareText) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
        }
        .labelStyle(.titleAndIcon)
    }
}

struct SourceLinkList: View {
    let sourceIds: [String]

    var body: some View {
        FramedBlock {
            VStack(alignment: .leading, spacing: 10) {
                Text("Sources")
                    .font(.headline)
                ForEach(CommonHorizonData.sources(for: sourceIds)) { source in
                    SourceRow(source: source)
                }
            }
        }
    }
}

struct SourceFootnote: View {
    let sourceIds: [String]

    var body: some View {
        let names = CommonHorizonData.sources(for: sourceIds).map(\.publisher)
        Text(names.joined(separator: " + "))
            .font(.caption.weight(.medium))
            .foregroundStyle(.secondary)
            .lineLimit(2)
    }
}

struct SourceRow: View {
    let source: Source

    var body: some View {
        Link(destination: source.url) {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: icon(for: source.kind))
                    .foregroundStyle(.tint)
                    .font(.body)
                    .frame(width: 26, height: 26)
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(source.title)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.primary)
                        Spacer(minLength: 8)
                        Text(source.kind.rawValue)
                            .font(.caption.weight(.bold))
                            .foregroundStyle(.secondary)
                    }
                    Text("\(source.author) - \(source.publisher), \(source.year)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(source.note)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(3)
                }
                Image(systemName: "arrow.up.forward")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(.secondary)
                    .accessibilityHidden(true)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
        .accessibilityHint("Opens source in the browser")
    }

    private func icon(for kind: SourceKind) -> String {
        switch kind {
        case .book:
            return "book.closed.fill"
        case .article:
            return "doc.text.fill"
        case .report:
            return "chart.bar.doc.horizontal.fill"
        case .reference:
            return "text.book.closed.fill"
        }
    }
}

struct StatCard: View {
    let stat: EvidenceStat
    var showSignal: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: stat.symbol)
                    .foregroundStyle(stat.tint)
                    .font(.title3)
                    .frame(width: 30, height: 30)
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 4) {
                    Text(stat.value)
                        .font(.title2.bold())
                        .monospacedDigit()
                        .foregroundStyle(.primary)
                    Text(stat.label)
                        .font(.subheadline.weight(.semibold))
                }
                Spacer(minLength: 8)
                if showSignal {
                    StatSignal(tint: stat.tint)
                        .frame(width: 54, height: 34)
                        .accessibilityHidden(true)
                }
            }
            Text(stat.context)
                .font(.callout)
                .foregroundStyle(.secondary)
            SourceFootnote(sourceIds: stat.sourceIds)
        }
        .accessibilityElement(children: .combine)
    }
}

struct StatSignal: View {
    let tint: Color

    private let values: [CGFloat] = [0.35, 0.52, 0.44, 0.72, 0.9]

    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            ForEach(Array(values.enumerated()), id: \.offset) { _, value in
                Capsule()
                    .fill(tint.opacity(0.78))
                    .frame(width: 7, height: max(6, value * 34))
            }
        }
    }
}

struct ArgumentSummaryCard: View {
    let card: ArgumentCard
    var showImage = true

    var body: some View {
        FramedBlock(padding: 0) {
            VStack(alignment: .leading, spacing: 0) {
                if showImage {
                    HorizonImage(name: card.imageName, height: 190)
                }
                VStack(alignment: .leading, spacing: 12) {
                    PillLabel(title: card.lens, systemImage: card.symbol, tint: card.tint)
                    Text(card.thesis)
                        .font(.title3.bold())
                        .fixedSize(horizontal: false, vertical: true)
                    Text(card.body)
                        .font(.body)
                        .foregroundStyle(.secondary)
                    Divider()
                    Text(card.whatChanges)
                        .font(.callout.weight(.medium))
                    SourceFootnote(sourceIds: card.sourceIds)
                    ActionRow(id: card.id, shareText: "\(card.thesis)\n\n\(card.whatChanges)")
                }
                .padding(16)
            }
        }
    }
}

struct MediaFeatureCard: View {
    let feature: MediaFeature

    var body: some View {
        FramedBlock(padding: 0) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    HorizonImage(name: feature.imageName, height: 190)
                    if feature.videoName != nil {
                        Label(feature.runtime, systemImage: "play.fill")
                            .font(.caption.weight(.bold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(.black.opacity(0.56), in: Capsule())
                            .padding(12)
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    PillLabel(title: feature.kicker, systemImage: feature.symbol, tint: feature.tint)
                    Text(feature.title)
                        .font(.title3.bold())
                    Text(feature.body)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    HStack {
                        SourceFootnote(sourceIds: feature.sourceIds)
                        Spacer(minLength: 8)
                        Image(systemName: "chevron.right")
                            .font(.caption.weight(.bold))
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(16)
            }
        }
        .accessibilityElement(children: .combine)
    }
}

struct LocalVideoPlayerView: View {
    let videoName: String
    @State private var player: AVPlayer?

    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            Group {
                if let player {
                    VideoPlayer(player: player)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 220)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous))
            .onAppear {
                if player == nil {
                    let nextPlayer = AVPlayer(url: url)
                    nextPlayer.isMuted = true
                    player = nextPlayer
                }
                player?.play()
            }
            .onDisappear {
                player?.pause()
            }
        } else {
            ContentUnavailableView("Video unavailable", systemImage: "video.slash")
        }
    }
}

struct FrameworkTile: View {
    let item: Framework

    var body: some View {
        FramedBlock {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: item.symbol)
                    .foregroundStyle(item.tint)
                    .font(.title2)
                    .accessibilityHidden(true)
                Text(item.title)
                    .font(.headline)
                Text(item.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
            }
            .frame(maxWidth: .infinity, minHeight: 132, alignment: .topLeading)
        }
        .accessibilityElement(children: .combine)
    }
}

struct FrameworkRow: View {
    let item: Framework

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: item.symbol)
                .foregroundStyle(item.tint)
                .font(.title3)
                .frame(width: 28)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
    }
}

struct StoryRow: View {
    let story: Story

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: story.symbol)
                .foregroundStyle(story.tint)
                .font(.title3)
                .frame(width: 28)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 4) {
                Text(story.title)
                    .font(.headline)
                Text(story.period)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
    }
}

struct SavedItemRow: View {
    let item: SavedItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: item.symbol)
                .foregroundStyle(item.tint)
                .font(.title3)
                .frame(width: 30)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.kind)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(item.tint)
                Text(item.title)
                    .font(.headline)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
    }
}
