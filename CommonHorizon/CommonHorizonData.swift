import Foundation
import SwiftUI

enum CommonHorizonData {
    static let sources: [Source] = [
        Source(
            id: "sep-socialism",
            title: "Socialism",
            author: "Pablo Gilabert and Martin O'Neill",
            year: "Winter 2025",
            publisher: "Stanford Encyclopedia of Philosophy",
            kind: .reference,
            urlString: "https://plato.stanford.edu/archives/win2025/entries/socialism/",
            note: "Defines socialism around effective worker control of productive resources and explains exploitation, domination, and democracy arguments."
        ),
        Source(
            id: "oxfam-2026-rule-rich",
            title: "Billionaire wealth jumps three times faster in 2025",
            author: "Oxfam International",
            year: "2026",
            publisher: "Oxfam",
            kind: .report,
            urlString: "https://www.oxfam.org/en/press-releases/billionaire-wealth-jumps-three-times-faster-2025-highest-peak-ever-sparking",
            note: "Reports billionaire wealth reaching $18.3 trillion in 2025 and links extreme wealth to political power."
        ),
        Source(
            id: "world-inequality-2026",
            title: "World Inequality Report 2026: Executive Summary",
            author: "World Inequality Lab",
            year: "2026",
            publisher: "World Inequality Lab",
            kind: .report,
            urlString: "https://wir2026.wid.world/insight/executive-summary/",
            note: "Shows the wealthiest 0.001 percent control about three times more wealth than half of humanity combined."
        ),
        Source(
            id: "epi-productivity-pay",
            title: "The Productivity-Pay Gap",
            author: "Economic Policy Institute",
            year: "2026",
            publisher: "Economic Policy Institute",
            kind: .report,
            urlString: "https://www.epi.org/productivity-pay-gap/",
            note: "Tracks the long divergence between economywide productivity and typical worker compensation."
        ),
        Source(
            id: "epi-unions-democracy",
            title: "Strong unions, stronger communities and democracy",
            author: "Celine McNicholas, Margaret Poydock, Heidi Shierholz, and Hilary Wething",
            year: "2026",
            publisher: "Economic Policy Institute",
            kind: .report,
            urlString: "https://www.epi.org/publication/strong-unions-stronger-communities-and-democracy/",
            note: "Summarizes union wage premiums, racial wage effects, and democracy benefits."
        ),
        Source(
            id: "epi-unionization-2025",
            title: "Workers' resolve drives increase in unionization in 2025",
            author: "Celine McNicholas, Margaret Poydock, and Heidi Shierholz",
            year: "2026",
            publisher: "Economic Policy Institute",
            kind: .report,
            urlString: "https://www.epi.org/publication/workers-resolve-drives-increase-in-unionization-in-2025/",
            note: "Reports 16.5 million U.S. workers represented by unions in 2025."
        ),
        Source(
            id: "commonwealth-health-2026",
            title: "U.S. Health Care from a Global Perspective: 2026 Expanded Edition",
            author: "Commonwealth Fund",
            year: "2026",
            publisher: "Commonwealth Fund",
            kind: .report,
            urlString: "https://www.commonwealthfund.org/publications/issue-briefs/2026/may/us-health-care-global-perspective-2026",
            note: "Compares U.S. coverage, health spending, access, and outcomes against peer countries."
        ),
        Source(
            id: "kff-health-spending-2026",
            title: "How does health spending in the U.S. compare to other countries?",
            author: "Peterson-KFF Health System Tracker",
            year: "2026",
            publisher: "Peterson-KFF",
            kind: .report,
            urlString: "https://www.healthsystemtracker.org/chart-collection/health-spending-u-s-compare-countries/",
            note: "Finds U.S. health spending per person is roughly double comparable wealthy countries."
        ),
        Source(
            id: "harvard-housing-2025",
            title: "The State of the Nation's Housing 2025",
            author: "Joint Center for Housing Studies of Harvard University",
            year: "2025",
            publisher: "Harvard University",
            kind: .report,
            urlString: "https://www.jchs.harvard.edu/sites/default/files/reports/files/Harvard_JCHS_The_State_of_the_Nations_Housing_2025.pdf",
            note: "Documents home price pressure, renter burdens, low-rent unit loss, and homelessness pressure."
        ),
        Source(
            id: "walmart-planning",
            title: "The People's Republic of Walmart",
            author: "Leigh Phillips and Michal Rozworski",
            year: "2019",
            publisher: "Verso Books",
            kind: .book,
            urlString: "https://www.versobooks.com/products/636-the-people-s-republic-of-walmart",
            note: "Argues large firms already use internal planning at scale, shifting the question toward democratic planning."
        ),
        Source(
            id: "radical-abundance",
            title: "Radical Abundance",
            author: "Kai Heron",
            year: "2025",
            publisher: "Pluto Press",
            kind: .book,
            urlString: "https://www.plutobooks.com/product/radical-abundance/",
            note: "Frames abundance as democratic control over collective reproduction and human and non-human flourishing."
        ),
        Source(
            id: "half-earth",
            title: "Half-Earth Socialism",
            author: "Troy Vettese and Drew Pendergrass",
            year: "2022",
            publisher: "Half-Earth Socialism",
            kind: .book,
            urlString: "https://www.half.earth/",
            note: "Combines ecological planning, energy transition, rewilding, food systems, and speculative democratic futures."
        ),
        Source(
            id: "vulture-capitalism",
            title: "Vulture Capitalism",
            author: "Grace Blakeley",
            year: "2024",
            publisher: "Simon & Schuster",
            kind: .book,
            urlString: "https://www.simonandschuster.com/books/Vulture-Capitalism/Grace-Blakeley/9781982180867",
            note: "Argues capitalism is already planned, but by corporate and financial power rather than democratic publics."
        ),
        Source(
            id: "health-communism",
            title: "Health Communism",
            author: "Beatrice Adler-Bolton and Artie Vierkant",
            year: "2022",
            publisher: "Verso Books",
            kind: .book,
            urlString: "https://www.versobooks.com/products/2801-health-communism",
            note: "Centers disability, sickness, aging, and care as political tests of whether human life is valued beyond productivity."
        ),
        Source(
            id: "long-heat",
            title: "The Long Heat",
            author: "Wim Carton and Andreas Malm",
            year: "2025",
            publisher: "Verso Books",
            kind: .book,
            urlString: "https://www.versobooks.com/products/3317-the-long-heat",
            note: "Critiques climate techno-fixes and argues climate politics requires confronting fossil capital and political economy."
        ),
        Source(
            id: "worker-coop-sector-2025",
            title: "2025 State of the Sector of Worker Cooperatives",
            author: "Democracy at Work Institute and U.S. Federation of Worker Cooperatives",
            year: "2026",
            publisher: "U.S. Federation of Worker Cooperatives",
            kind: .report,
            urlString: "https://www.usworker.coop/blog/the-2025-state-of-the-sector-report-is-here/",
            note: "Tracks the U.S. worker cooperative and democratic workplace sector using 2024 census data."
        )
    ]

    static let todayCards: [ArgumentCard] = [
        ArgumentCard(
            id: "ownership-is-power",
            lens: "The first shift",
            thesis: "Capitalism is not just markets. It is a power arrangement.",
            body: "The core socialist claim is that political freedom is incomplete when most people spend their working lives inside institutions they do not own, cannot meaningfully govern, and depend on for survival.",
            whatChanges: "The question moves from who gets a bigger slice to who gets to decide what is produced, how work is organized, and where the surplus goes.",
            imageName: "commons-culture",
            sourceIds: ["sep-socialism", "vulture-capitalism"],
            symbol: "person.3.sequence.fill",
            tint: .blue
        ),
        ArgumentCard(
            id: "abundance-is-organized",
            lens: "The second shift",
            thesis: "Scarcity is often political, not natural.",
            body: "Modern societies can produce astonishing wealth, food, housing, medicine, knowledge, and computational capacity. The shortage appears when access is filtered through profit, rent, debt, and ownership.",
            whatChanges: "Abundance becomes a design problem: how to direct production toward need, care, culture, science, and ecological repair.",
            imageName: "commons-culture",
            sourceIds: ["radical-abundance", "walmart-planning", "half-earth"],
            symbol: "shippingbox.and.arrow.backward.fill",
            tint: .green
        ),
        ArgumentCard(
            id: "care-is-the-test",
            lens: "The human test",
            thesis: "A society reveals itself by how it treats people who cannot be made profitable.",
            body: "Health, disability, childhood, old age, and crisis expose the cruelty of tying care to productivity. A humane economy starts from unconditional human worth.",
            whatChanges: "Care stops being a private burden and becomes a common infrastructure for freedom.",
            imageName: "commons-culture",
            sourceIds: ["health-communism", "commonwealth-health-2026", "kff-health-spending-2026"],
            symbol: "cross.case.fill",
            tint: .red
        )
    ]

    static let evidenceStats: [EvidenceStat] = [
        EvidenceStat(
            id: "billionaire-wealth",
            value: "$18.3T",
            label: "billionaire wealth in 2025",
            context: "Oxfam reported billionaire wealth reached its highest level in history in 2025, growing over 16 percent that year.",
            category: "Wealth",
            sourceIds: ["oxfam-2026-rule-rich"],
            symbol: "dollarsign.circle.fill",
            tint: .mint
        ),
        EvidenceStat(
            id: "point-001",
            value: "0.001%",
            label: "controls more than half of humanity",
            context: "The World Inequality Report 2026 says fewer than 60,000 ultra-wealthy people control roughly three times more wealth than the bottom half of humanity combined.",
            category: "Wealth",
            sourceIds: ["world-inequality-2026"],
            symbol: "chart.pie.fill",
            tint: .indigo
        ),
        EvidenceStat(
            id: "productivity-pay",
            value: "92.4% vs 33.6%",
            label: "productivity grew far faster than typical pay",
            context: "From 1979Q4 to 2025Q4, productivity rose 92.4 percent while typical hourly pay rose 33.6 percent, according to EPI.",
            category: "Labor",
            sourceIds: ["epi-productivity-pay"],
            symbol: "chart.line.uptrend.xyaxis",
            tint: .orange
        ),
        EvidenceStat(
            id: "union-premium",
            value: "12.8%",
            label: "average wage premium for union-covered workers",
            context: "EPI reports workers covered by union contracts earn 12.8 percent more than comparable nonunion workers.",
            category: "Worker power",
            sourceIds: ["epi-unions-democracy"],
            symbol: "person.2.badge.gearshape.fill",
            tint: .blue
        ),
        EvidenceStat(
            id: "union-represented",
            value: "16.5M",
            label: "U.S. workers represented by unions in 2025",
            context: "Union representation rose by 463,000 workers in 2025, reaching the highest represented-worker count in 16 years.",
            category: "Worker power",
            sourceIds: ["epi-unionization-2025"],
            symbol: "hands.clap.fill",
            tint: .green
        ),
        EvidenceStat(
            id: "health-spending",
            value: "18%",
            label: "of U.S. GDP spent on health care in 2024",
            context: "The Commonwealth Fund reports the U.S. spent nearly twice the OECD average while about 27 million people remained uninsured.",
            category: "Care",
            sourceIds: ["commonwealth-health-2026", "kff-health-spending-2026"],
            symbol: "heart.text.square.fill",
            tint: .red
        ),
        EvidenceStat(
            id: "renter-burden",
            value: "22.6M",
            label: "cost-burdened renter households",
            context: "Harvard JCHS reports 50 percent of renters were cost burdened in 2023, with 12.1 million severely burdened.",
            category: "Housing",
            sourceIds: ["harvard-housing-2025"],
            symbol: "house.fill",
            tint: .purple
        ),
        EvidenceStat(
            id: "low-rent-loss",
            value: "-30%",
            label: "low-rent units lost from 2013 to 2023",
            context: "Harvard JCHS reports units renting for less than $1,000 fell from 24.8 million to 17.2 million after inflation adjustment.",
            category: "Housing",
            sourceIds: ["harvard-housing-2025"],
            symbol: "building.2.fill",
            tint: .brown
        )
    ]

    static let frameworks: [Framework] = [
        Framework(
            id: "exploitation",
            title: "Exploitation",
            subtitle: "Who receives the surplus?",
            principles: [
                "Workers sell labor power because they do not control the means of production.",
                "Capital owners can keep the gap between what workers produce and what wages buy.",
                "Rising productivity without shared gains makes the extraction visible."
            ],
            practice: "Read every business story by asking where the surplus goes and who had the power to decide.",
            sourceIds: ["sep-socialism", "epi-productivity-pay"],
            symbol: "arrow.left.arrow.right.circle.fill",
            tint: .orange
        ),
        Framework(
            id: "domination",
            title: "Domination",
            subtitle: "Freedom is not only legal choice.",
            principles: [
                "A worker can be legally free while still structurally dependent.",
                "Workplace hierarchy shapes hours, dignity, health, and speech.",
                "Capital also shapes politics through media, lobbying, investment threats, and state access."
            ],
            practice: "Ask whether people have real power over the rules they live under.",
            sourceIds: ["sep-socialism", "vulture-capitalism", "oxfam-2026-rule-rich"],
            symbol: "building.columns.fill",
            tint: .blue
        ),
        Framework(
            id: "artificial-scarcity",
            title: "Artificial Scarcity",
            subtitle: "Need exists beside abundance.",
            principles: [
                "Homes can sit empty while renters are overburdened.",
                "Medicine can exist while treatment remains unaffordable.",
                "Culture and science can be abundant while access is paywalled."
            ],
            practice: "Separate physical scarcity from ownership, pricing, and policy bottlenecks.",
            sourceIds: ["harvard-housing-2025", "commonwealth-health-2026", "health-communism"],
            symbol: "lock.open.fill",
            tint: .mint
        ),
        Framework(
            id: "democratic-planning",
            title: "Democratic Planning",
            subtitle: "Planning already exists. The question is who controls it.",
            principles: [
                "Large corporations coordinate production internally at enormous scale.",
                "Public systems also plan money, infrastructure, research, health, and emergency response.",
                "Socialism redirects planning from private profit toward democratic priorities."
            ],
            practice: "Look for hidden planning, then ask how it could become public, transparent, and accountable.",
            sourceIds: ["walmart-planning", "vulture-capitalism"],
            symbol: "map.fill",
            tint: .teal
        ),
        Framework(
            id: "care-economy",
            title: "Care",
            subtitle: "Human value before market value.",
            principles: [
                "Everyone depends on care across life.",
                "Health systems organized around profit treat disabled, sick, old, and poor people as costs.",
                "A free society treats care as infrastructure, not charity."
            ],
            practice: "Judge policy by whether it expands the dignity of people with the least market power.",
            sourceIds: ["health-communism", "commonwealth-health-2026"],
            symbol: "heart.fill",
            tint: .red
        ),
        Framework(
            id: "ecological-abundance",
            title: "Ecological Abundance",
            subtitle: "The good life within planetary repair.",
            principles: [
                "Capitalism treats nature as a sink, input, asset, or speculative frontier.",
                "Climate repair requires political power over energy, land, food, and production.",
                "Abundance means more time, care, culture, health, and ecological stability, not endless throughput."
            ],
            practice: "Pair material security with lower waste, more public goods, and democratic climate planning.",
            sourceIds: ["half-earth", "radical-abundance", "long-heat"],
            symbol: "leaf.fill",
            tint: .green
        )
    ]

    static let stories: [Story] = [
        Story(
            id: "sewer-socialism",
            title: "Public goods can be popular because they are felt.",
            period: "Municipal socialism",
            summary: "The old 'sewer socialism' tradition made socialism concrete through clean water, sanitation, parks, public works, and honest local administration.",
            takeaway: "The most persuasive politics often begins with reliable systems people use every day.",
            sourceIds: ["sep-socialism"],
            symbol: "water.waves",
            tint: .cyan
        ),
        Story(
            id: "meidner-plan",
            title: "Worker funds offered a path beyond social democracy.",
            period: "Sweden, 1970s",
            summary: "The Meidner Plan proposed transferring firm ownership into worker-controlled funds, using profits generated by workers to expand democratic ownership.",
            takeaway: "The welfare state can protect people, but ownership decides whether capital keeps veto power.",
            sourceIds: ["sep-socialism"],
            symbol: "person.3.fill",
            tint: .blue
        ),
        Story(
            id: "coops",
            title: "Democratic workplaces already exist.",
            period: "Now",
            summary: "Worker cooperatives and democratic workplaces show that firms can be organized around voice, shared ownership, job quality, and long-term resilience.",
            takeaway: "The point is not to imagine democracy at work from zero. It is to scale what is already real.",
            sourceIds: ["worker-coop-sector-2025"],
            symbol: "person.2.circle.fill",
            tint: .green
        ),
        Story(
            id: "health",
            title: "Care reveals the moral limit of productivity politics.",
            period: "Every life",
            summary: "Health communism argues that sick, disabled, aging, and institutionalized people are not edge cases. They expose whether society values life beyond output.",
            takeaway: "Freedom is fragile if illness can turn into poverty, exclusion, or abandonment.",
            sourceIds: ["health-communism", "commonwealth-health-2026"],
            symbol: "cross.fill",
            tint: .red
        ),
        Story(
            id: "climate-planning",
            title: "Climate repair is a planning problem and a power problem.",
            period: "Overshoot era",
            summary: "The Long Heat argues that relying on speculative techno-fixes can preserve fossil power while delaying the political transformation climate stability requires.",
            takeaway: "Technology matters, but who controls technology and production matters more.",
            sourceIds: ["long-heat", "half-earth"],
            symbol: "thermometer.sun.fill",
            tint: .orange
        )
    ]

    static let futureScenarios: [FutureScenario] = [
        FutureScenario(
            id: "housing-as-infrastructure",
            title: "Housing as infrastructure",
            premise: "Homes are treated like roads, schools, and water systems: essential conditions for public life.",
            world: "Cities build and maintain permanently affordable public and cooperative housing, removing shelter from speculative scarcity.",
            sourceIds: ["harvard-housing-2025", "radical-abundance"],
            symbol: "house.and.flag.fill",
            tint: .purple
        ),
        FutureScenario(
            id: "science-without-rent",
            title: "Science without rent",
            premise: "Research funded by society returns to society.",
            world: "Public research, medicines, data, and climate technology become common infrastructure instead of tollbooths for monopoly rents.",
            sourceIds: ["health-communism", "vulture-capitalism"],
            symbol: "atom",
            tint: .indigo
        ),
        FutureScenario(
            id: "time-as-abundance",
            title: "Time as abundance",
            premise: "Productivity gains become free time, care time, learning time, and civic time.",
            world: "Automation and productivity are directed toward shorter workweeks and richer public life instead of layoffs and shareholder extraction.",
            sourceIds: ["epi-productivity-pay", "walmart-planning", "radical-abundance"],
            symbol: "clock.badge.checkmark.fill",
            tint: .teal
        )
    ]

    static let mediaFeatures: [MediaFeature] = [
        MediaFeature(
            id: "opening-film",
            kicker: "Watch",
            title: "A society can be planned for life, not extraction.",
            body: "A short visual prompt for the app's central move: planning already exists, but it can be made democratic, public, ecological, and humane.",
            imageName: "horizon-planning",
            videoName: "horizon-loop",
            runtime: "0:06",
            sourceIds: ["walmart-planning", "vulture-capitalism", "radical-abundance"],
            symbol: "play.rectangle.fill",
            tint: .teal
        ),
        MediaFeature(
            id: "proof-visual",
            kicker: "Read the pattern",
            title: "The proof is not one statistic. It is the shape of power.",
            body: "Wealth concentration, wage stagnation, medical cost, housing burden, and union gains point to the same question: who controls the institutions people depend on?",
            imageName: "proof-economy",
            videoName: nil,
            runtime: "Evidence map",
            sourceIds: ["oxfam-2026-rule-rich", "world-inequality-2026", "epi-productivity-pay", "harvard-housing-2025"],
            symbol: "chart.line.uptrend.xyaxis",
            tint: .orange
        ),
        MediaFeature(
            id: "commons-visual",
            kicker: "Possible world",
            title: "Abundance looks like public time, care, science, and culture.",
            body: "The horizon is not more private luxury beside public precarity. It is shared capacity: libraries, labs, clinics, childcare, repair, art, rest, and democratic work.",
            imageName: "commons-culture",
            videoName: nil,
            runtime: "Scenario",
            sourceIds: ["health-communism", "half-earth", "radical-abundance"],
            symbol: "sparkles",
            tint: .green
        )
    ]

    static let glossary: [GlossaryTerm] = [
        GlossaryTerm(
            id: "socialism",
            term: "Socialism",
            definition: "A family of political-economic projects that move effective control of productive resources away from a capitalist owning class and toward workers, communities, or democratic publics.",
            sourceIds: ["sep-socialism"]
        ),
        GlossaryTerm(
            id: "communism",
            term: "Communism",
            definition: "In classical Marxist usage, the horizon beyond capitalism and transitional socialism: a classless, stateless society where production is organized around need and free human development.",
            sourceIds: ["sep-socialism"]
        ),
        GlossaryTerm(
            id: "democratic-planning-term",
            term: "Democratic planning",
            definition: "The idea that production, investment, care, energy, and infrastructure can be coordinated through public, worker, and community institutions rather than private command.",
            sourceIds: ["walmart-planning", "vulture-capitalism"]
        ),
        GlossaryTerm(
            id: "surplus",
            term: "Surplus",
            definition: "The value left after the costs of production and reproduction are covered. Socialist arguments ask who creates it, who controls it, and who benefits from it.",
            sourceIds: ["sep-socialism", "epi-productivity-pay"]
        )
    ]

    static let hardQuestions: [HardQuestion] = [
        HardQuestion(
            id: "authoritarianism",
            question: "Does this require top-down state control?",
            answer: "Not in the democratic socialist frame used here. The app emphasizes worker control, public accountability, co-ops, democratic planning, and civil freedom rather than one-party command.",
            sourceIds: ["sep-socialism", "worker-coop-sector-2025", "walmart-planning"]
        ),
        HardQuestion(
            id: "markets",
            question: "Are markets and socialism mutually exclusive?",
            answer: "Not always. The central issue is not whether any exchange exists, but who controls productive assets, investment, work rules, and essential goods.",
            sourceIds: ["sep-socialism", "vulture-capitalism"]
        ),
        HardQuestion(
            id: "innovation",
            question: "What about innovation?",
            answer: "The v1 claim is not that markets never innovate. It is that science, public research, workers, and shared infrastructure already create much of the base that private firms later monetize.",
            sourceIds: ["vulture-capitalism", "health-communism", "radical-abundance"]
        )
    ]

    static func sources(for ids: [String]) -> [Source] {
        let lookup = Dictionary(uniqueKeysWithValues: sources.map { ($0.id, $0) })
        return ids.compactMap { lookup[$0] }
    }

    static func savedItems(for ids: Set<String>) -> [SavedItem] {
        allSavedItems.filter { ids.contains($0.id) }
    }

    static var allSavedItems: [SavedItem] {
        var items: [SavedItem] = []

        items.append(contentsOf: todayCards.map {
            SavedItem(
                id: $0.id,
                kind: "Today",
                title: $0.thesis,
                subtitle: $0.lens,
                symbol: $0.symbol,
                tint: $0.tint
            )
        })

        items.append(contentsOf: evidenceStats.map {
            SavedItem(
                id: $0.id,
                kind: $0.category,
                title: $0.value,
                subtitle: $0.label,
                symbol: $0.symbol,
                tint: $0.tint
            )
        })

        items.append(contentsOf: frameworks.map {
            SavedItem(
                id: $0.id,
                kind: "Framework",
                title: $0.title,
                subtitle: $0.subtitle,
                symbol: $0.symbol,
                tint: $0.tint
            )
        })

        items.append(contentsOf: stories.map {
            SavedItem(
                id: $0.id,
                kind: "Story",
                title: $0.title,
                subtitle: $0.period,
                symbol: $0.symbol,
                tint: $0.tint
            )
        })

        items.append(contentsOf: futureScenarios.map {
            SavedItem(
                id: $0.id,
                kind: "Scenario",
                title: $0.title,
                subtitle: $0.premise,
                symbol: $0.symbol,
                tint: $0.tint
            )
        })

        items.append(contentsOf: mediaFeatures.map {
            SavedItem(
                id: $0.id,
                kind: $0.kicker,
                title: $0.title,
                subtitle: $0.runtime,
                symbol: $0.symbol,
                tint: $0.tint
            )
        })

        return items
    }

    static func validate() throws {
        let sourceIds = Set(sources.map(\.id))
        let allReferencedIds = allSourceReferences

        guard sources.allSatisfy({ URL(string: $0.urlString) != nil }) else {
            throw HorizonDataIssue.invalidURL
        }

        guard allReferencedIds.allSatisfy({ !$0.isEmpty }) else {
            throw HorizonDataIssue.missingSources
        }

        guard allReferencedIds.allSatisfy({ sourceIds.contains($0) }) else {
            throw HorizonDataIssue.invalidSourceReference
        }
    }

    static var allSourceReferences: [String] {
        var ids: [String] = []
        ids.append(contentsOf: todayCards.flatMap(\.sourceIds))
        ids.append(contentsOf: evidenceStats.flatMap(\.sourceIds))
        ids.append(contentsOf: frameworks.flatMap(\.sourceIds))
        ids.append(contentsOf: stories.flatMap(\.sourceIds))
        ids.append(contentsOf: futureScenarios.flatMap(\.sourceIds))
        ids.append(contentsOf: mediaFeatures.flatMap(\.sourceIds))
        ids.append(contentsOf: glossary.flatMap(\.sourceIds))
        ids.append(contentsOf: hardQuestions.flatMap(\.sourceIds))
        return ids
    }
}
