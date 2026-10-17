import SwiftUI

enum HorizonTab: String, Hashable {
    case today
    case proof
    case frameworks
    case stories
    case library
}

enum LibrarySection: String, CaseIterable, Identifiable {
    case sources = "Sources"
    case glossary = "Glossary"
    case saved = "Saved"
    case questions = "Questions"

    var id: String { rawValue }
}

struct CommonHorizonRootView: View {
    @State private var selection: HorizonTab

    init() {
        let requestedTab = ProcessInfo.processInfo.environment["COMMON_HORIZON_START_TAB"]
        _selection = State(initialValue: HorizonTab(rawValue: requestedTab ?? "") ?? .today)
    }

    var body: some View {
        TabView(selection: $selection) {
            TodayView()
                .tabItem { Label("Today", systemImage: "sun.max.fill") }
                .tag(HorizonTab.today)

            ProofView()
                .tabItem { Label("Proof", systemImage: "chart.bar.xaxis") }
                .tag(HorizonTab.proof)

            FrameworksView()
                .tabItem { Label("Frameworks", systemImage: "square.grid.2x2.fill") }
                .tag(HorizonTab.frameworks)

            StoriesView()
                .tabItem { Label("Stories", systemImage: "book.pages.fill") }
                .tag(HorizonTab.stories)

            LibraryView()
                .tabItem { Label("Library", systemImage: "books.vertical.fill") }
                .tag(HorizonTab.library)
        }
        .tint(.teal)
        .toolbarBackground(Color(uiColor: .systemBackground), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct TodayView: View {
    private let primary = CommonHorizonData.todayCards[0]
    private let stats = Array(CommonHorizonData.evidenceStats.prefix(3))
    private let openingFeature = CommonHorizonData.mediaFeatures[0]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ChapterHero(
                        imageName: primary.imageName,
                        kicker: "Common Horizon",
                        title: "Work and wealth can be organized for everyone.",
                        subtitle: "A daily lens for seeing exploitation clearly and imagining abundance without turning away from evidence.",
                        tint: .teal,
                        symbol: "sun.max.fill"
                    )

                    NavigationLink(value: openingFeature) {
                        MediaFeatureCard(feature: openingFeature)
                    }
                    .buttonStyle(.plain)

                    SectionHeader("Today's thesis", subtitle: "Start with power, then ask what changes.")
                    ArgumentSummaryCard(card: primary, showImage: false)

                    SectionHeader("Material proof", subtitle: "Three signals for today's lens")
                    VStack(spacing: 12) {
                        ForEach(stats) { stat in
                            NavigationLink(value: stat) {
                                FramedBlock {
                                    StatCard(stat: stat)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    FramedBlock {
                        VStack(alignment: .leading, spacing: 12) {
                            PillLabel(title: "Reflection", systemImage: "arrow.triangle.2.circlepath", tint: .teal)
                            Text("The everyday question stops being whether a person deserves enough to live.")
                                .font(.headline)
                            Text("It becomes whether any society this productive can justify forcing people through fear, debt, rent, and private command to reach the basics.")
                                .font(.body)
                                .foregroundStyle(.secondary)
                            SourceFootnote(sourceIds: primary.sourceIds + stats.flatMap(\.sourceIds))
                        }
                    }
                }
                .padding(20)
            }
            .background(HorizonTheme.background)
            .navigationTitle("Today")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: EvidenceStat.self) { stat in
                EvidenceDetailView(stat: stat)
            }
            .navigationDestination(for: MediaFeature.self) { feature in
                MediaFeatureDetailView(feature: feature)
            }
        }
    }
}

struct ProofView: View {
    private let feature = CommonHorizonData.mediaFeatures[1]
    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ChapterHero(
                        imageName: feature.imageName,
                        kicker: "Proof",
                        title: "Follow the material pattern.",
                        subtitle: "The numbers are not trivia. They are evidence about ownership, power, scarcity, and the terms of ordinary life.",
                        tint: .orange,
                        symbol: "chart.line.uptrend.xyaxis"
                    )

                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(CommonHorizonData.evidenceStats.prefix(4)) { stat in
                            NavigationLink(value: stat) {
                                FramedBlock {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Image(systemName: stat.symbol)
                                            .foregroundStyle(stat.tint)
                                            .font(.title3)
                                            .accessibilityHidden(true)
                                        Text(stat.value)
                                            .font(.title2.bold())
                                            .monospacedDigit()
                                        Text(stat.category)
                                            .font(.caption.weight(.bold))
                                            .foregroundStyle(.secondary)
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 112, alignment: .topLeading)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    NavigationLink(value: feature) {
                        MediaFeatureCard(feature: feature)
                    }
                    .buttonStyle(.plain)

                    SectionHeader("Evidence cards", subtitle: "Tap any card for sources and the interpretive claim.")
                    VStack(spacing: 12) {
                        ForEach(CommonHorizonData.evidenceStats) { stat in
                            NavigationLink(value: stat) {
                                FramedBlock {
                                    StatCard(stat: stat)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .background(HorizonTheme.background)
            .navigationTitle("Proof")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: EvidenceStat.self) { stat in
                EvidenceDetailView(stat: stat)
            }
            .navigationDestination(for: MediaFeature.self) { feature in
                MediaFeatureDetailView(feature: feature)
            }
        }
    }
}

struct FrameworksView: View {
    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ChapterHero(
                        imageName: "horizon-planning",
                        kicker: "Frameworks",
                        title: "Six ways to see the same system.",
                        subtitle: "These lenses help turn vague frustration into a clearer map of labor, ownership, care, planning, and ecological abundance.",
                        tint: .teal,
                        symbol: "square.grid.2x2.fill"
                    )

                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(CommonHorizonData.frameworks) { item in
                            NavigationLink(value: item) {
                                FrameworkTile(item: item)
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    FramedBlock {
                        VStack(alignment: .leading, spacing: 12) {
                            PillLabel(title: "Practice", systemImage: "scope", tint: .teal)
                            Text("The point is not to memorize terms. It is to ask better questions in everyday life.")
                                .font(.headline)
                            Text("Who decides? Who benefits? What is treated as scarce? What would change if the people affected had real power over the institution?")
                                .font(.body)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(20)
            }
            .background(HorizonTheme.background)
            .navigationTitle("Frameworks")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Framework.self) { item in
                FrameworkDetailView(item: item)
            }
        }
    }
}

struct StoriesView: View {
    private let feature = CommonHorizonData.mediaFeatures[2]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ChapterHero(
                        imageName: feature.imageName,
                        kicker: "Stories",
                        title: "The possible is already scattered through history.",
                        subtitle: "Public goods, democratic workplaces, care politics, and climate planning are not fantasies. They are fragments waiting for scale and power.",
                        tint: .green,
                        symbol: "book.pages.fill"
                    )

                    NavigationLink(value: feature) {
                        MediaFeatureCard(feature: feature)
                    }
                    .buttonStyle(.plain)

                    SectionHeader("History and living examples")
                    VStack(spacing: 12) {
                        ForEach(CommonHorizonData.stories) { story in
                            NavigationLink(value: story) {
                                FramedBlock {
                                    StoryRow(story: story)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    SectionHeader("Future scenarios", subtitle: "Concrete enough to argue with, open enough to expand.")
                    VStack(spacing: 12) {
                        ForEach(CommonHorizonData.futureScenarios) { scenario in
                            NavigationLink(value: scenario) {
                                FramedBlock {
                                    HStack(alignment: .top, spacing: 12) {
                                        Image(systemName: scenario.symbol)
                                            .foregroundStyle(scenario.tint)
                                            .font(.title3)
                                            .frame(width: 30)
                                            .accessibilityHidden(true)
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(scenario.title)
                                                .font(.headline)
                                            Text(scenario.premise)
                                                .font(.subheadline)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .background(HorizonTheme.background)
            .navigationTitle("Stories")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Story.self) { story in
                StoryDetailView(story: story)
            }
            .navigationDestination(for: FutureScenario.self) { scenario in
                FutureScenarioDetailView(scenario: scenario)
            }
            .navigationDestination(for: MediaFeature.self) { feature in
                MediaFeatureDetailView(feature: feature)
            }
        }
    }
}

struct LibraryView: View {
    @State private var selectedSection: LibrarySection = .sources
    @AppStorage("commonHorizonSavedIDs") private var savedRawValue = ""

    private var savedItems: [SavedItem] {
        let ids = Set(savedRawValue.split(separator: ",").map(String.init))
        return CommonHorizonData.savedItems(for: ids)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Picker("Library section", selection: $selectedSection) {
                    ForEach(LibrarySection.allCases) { section in
                        Text(section.rawValue).tag(section)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)

                List {
                    switch selectedSection {
                    case .sources:
                        Section("Source index") {
                            ForEach(CommonHorizonData.sources) { source in
                                SourceRow(source: source)
                            }
                        }
                    case .glossary:
                        Section("Glossary") {
                            ForEach(CommonHorizonData.glossary) { term in
                                NavigationLink(value: term) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(term.term)
                                            .font(.headline)
                                        Text(term.definition)
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                            .lineLimit(3)
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                    case .saved:
                        Section("Saved cards") {
                            if savedItems.isEmpty {
                                ContentUnavailableView(
                                    "Nothing saved yet",
                                    systemImage: "bookmark",
                                    description: Text("Save cards from Today, Proof, Frameworks, Stories, or media details.")
                                )
                            } else {
                                ForEach(savedItems) { item in
                                    SavedItemRow(item: item)
                                }
                            }
                        }
                    case .questions:
                        Section("Hard questions") {
                            ForEach(CommonHorizonData.hardQuestions) { question in
                                NavigationLink(value: question) {
                                    Text(question.question)
                                        .font(.headline)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .background(HorizonTheme.background)
            .navigationTitle("Library")
            .navigationDestination(for: GlossaryTerm.self) { term in
                GlossaryDetailView(term: term)
            }
            .navigationDestination(for: HardQuestion.self) { question in
                HardQuestionDetailView(question: question)
            }
        }
    }
}

struct MediaFeatureDetailView: View {
    let feature: MediaFeature

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                if let videoName = feature.videoName {
                    LocalVideoPlayerView(videoName: videoName)
                } else {
                    HorizonImage(name: feature.imageName, height: 220)
                        .clipShape(RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous))
                }

                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        PillLabel(title: feature.kicker, systemImage: feature.symbol, tint: feature.tint)
                        Text(feature.title)
                            .font(.title2.bold())
                        Text(feature.body)
                            .font(.body)
                            .foregroundStyle(.secondary)
                        ActionRow(id: feature.id, shareText: "\(feature.title)\n\n\(feature.body)")
                    }
                }

                SourceLinkList(sourceIds: feature.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle(feature.kicker)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EvidenceDetailView: View {
    let stat: EvidenceStat

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                HorizonImage(name: "proof-economy", height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous))

                FramedBlock {
                    StatCard(stat: stat)
                }

                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        PillLabel(title: "Reading move", systemImage: "magnifyingglass", tint: stat.tint)
                        Text("Treat this as a clue about institutional power, not a standalone gotcha.")
                            .font(.headline)
                        Text("The deeper question is which ownership and policy choices make this outcome normal, profitable, or hard to change.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                        ActionRow(id: stat.id, shareText: "\(stat.value): \(stat.label)\n\n\(stat.context)")
                    }
                }

                SourceLinkList(sourceIds: stat.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle(stat.category)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FrameworkDetailView: View {
    let item: Framework

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        PillLabel(title: "Framework", systemImage: item.symbol, tint: item.tint)
                        Text(item.title)
                            .font(.largeTitle.bold())
                        Text(item.subtitle)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        ActionRow(id: item.id, shareText: "\(item.title): \(item.subtitle)\n\n\(item.practice)")
                    }
                }

                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Core ideas")
                            .font(.headline)
                        ForEach(item.principles, id: \.self) { principle in
                            Label(principle, systemImage: "checkmark.circle.fill")
                                .font(.body)
                                .labelStyle(.titleAndIcon)
                        }
                    }
                }

                FramedBlock {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Use it")
                            .font(.headline)
                        Text(item.practice)
                            .font(.body)
                    }
                }

                SourceLinkList(sourceIds: item.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StoryDetailView: View {
    let story: Story

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                HorizonImage(name: "commons-culture", height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous))

                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        PillLabel(title: story.period, systemImage: story.symbol, tint: story.tint)
                        Text(story.title)
                            .font(.title2.bold())
                        Text(story.summary)
                            .font(.body)
                            .foregroundStyle(.secondary)
                        Divider()
                        Text(story.takeaway)
                            .font(.body.weight(.medium))
                        ActionRow(id: story.id, shareText: "\(story.title)\n\n\(story.takeaway)")
                    }
                }

                SourceLinkList(sourceIds: story.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle("Story")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FutureScenarioDetailView: View {
    let scenario: FutureScenario

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                HorizonImage(name: "horizon-planning", height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: HorizonTheme.cardRadius, style: .continuous))

                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        PillLabel(title: "Possible world", systemImage: scenario.symbol, tint: scenario.tint)
                        Text(scenario.title)
                            .font(.title2.bold())
                        Text(scenario.premise)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Text(scenario.world)
                            .font(.body)
                        ActionRow(id: scenario.id, shareText: "\(scenario.title)\n\n\(scenario.world)")
                    }
                }

                SourceLinkList(sourceIds: scenario.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle("Possible world")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GlossaryDetailView: View {
    let term: GlossaryTerm

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                FramedBlock {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(term.term)
                            .font(.largeTitle.bold())
                        Text(term.definition)
                            .font(.body)
                    }
                }
                SourceLinkList(sourceIds: term.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle(term.term)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HardQuestionDetailView: View {
    let question: HardQuestion

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                FramedBlock {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(question.question)
                            .font(.title2.bold())
                        Text(question.answer)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                }
                SourceLinkList(sourceIds: question.sourceIds)
            }
            .padding(20)
        }
        .background(HorizonTheme.background)
        .navigationTitle("Hard question")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CommonHorizonRootView()
}
