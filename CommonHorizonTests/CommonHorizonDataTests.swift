import XCTest
@testable import CommonHorizon

final class CommonHorizonDataTests: XCTestCase {
    func testEveryContentItemReferencesValidSources() throws {
        XCTAssertNoThrow(try CommonHorizonData.validate())
    }

    func testSourceURLsAreHTTPLinks() {
        for source in CommonHorizonData.sources {
            XCTAssertTrue(source.url.scheme == "https" || source.url.scheme == "http", source.title)
            XCTAssertFalse(source.title.isEmpty)
            XCTAssertFalse(source.note.isEmpty)
        }
    }

    func testTodayHasTheRequiredThreeEvidenceCards() {
        XCTAssertEqual(Array(CommonHorizonData.evidenceStats.prefix(3)).count, 3)
        XCTAssertGreaterThanOrEqual(CommonHorizonData.todayCards.count, 3)
    }

    func testGlossarySeparatesSocialismAndCommunism() {
        let definitions = Dictionary(uniqueKeysWithValues: CommonHorizonData.glossary.map { ($0.id, $0.definition.lowercased()) })

        XCTAssertTrue(definitions["socialism", default: ""].contains("productive resources"))
        XCTAssertTrue(definitions["communism", default: ""].contains("classless"))
        XCTAssertTrue(definitions["communism", default: ""].contains("stateless"))
    }

    func testMediaFeaturesUseBundledMedia() {
        for feature in CommonHorizonData.mediaFeatures {
            XCTAssertNotNil(Bundle.main.url(forResource: feature.imageName, withExtension: "png"), feature.imageName)

            if let videoName = feature.videoName {
                XCTAssertNotNil(Bundle.main.url(forResource: videoName, withExtension: "mp4"), videoName)
            }
        }
    }

    func testSavedIndexCoversCoreContentAndUsesUniqueIDs() {
        let savedItems = CommonHorizonData.allSavedItems
        let ids = Set(savedItems.map(\.id))

        XCTAssertEqual(ids.count, savedItems.count)
        XCTAssertTrue(ids.contains(CommonHorizonData.todayCards[0].id))
        XCTAssertTrue(ids.contains(CommonHorizonData.evidenceStats[0].id))
        XCTAssertTrue(ids.contains(CommonHorizonData.frameworks[0].id))
        XCTAssertTrue(ids.contains(CommonHorizonData.stories[0].id))
        XCTAssertTrue(ids.contains(CommonHorizonData.futureScenarios[0].id))
        XCTAssertTrue(ids.contains(CommonHorizonData.mediaFeatures[0].id))
    }
}
