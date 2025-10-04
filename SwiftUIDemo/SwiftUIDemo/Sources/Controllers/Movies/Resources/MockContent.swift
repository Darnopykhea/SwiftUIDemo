//
//  MockContent.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 10/4/25.
//

import Foundation

extension MockLocalContentService {

    static let newsJSON = """
    [
      {
        "id": "n01",
        "title": "Swift 6 Released",
        "image": "https://picsum.photos/seed/swift/400/240",
        "date": "2025-09-30T11:00:00Z",
        "text": "Swift 6 brings major concurrency improvements, macros, and performance tweaks.",
        "link": "https://www.swift.org/blog/"
      },
      {
        "id": "n02",
        "title": "iOS 19 Beta Lands",
        "image": "https://picsum.photos/seed/ios/400/240",
        "date": "2025-09-29T10:30:00Z",
        "text": "The first beta of iOS 19 introduces revamped widgets and privacy tools.",
        "link": "https://developer.apple.com/ios/"
      },
      {
        "id": "n03",
        "title": "Xcode 17.1 Arrives",
        "image": "https://picsum.photos/seed/xcode/400/240",
        "date": "2025-09-28T09:45:00Z",
        "text": "Build times improved and SwiftUI previews are more reliable.",
        "link": "https://developer.apple.com/xcode/"
      },
      {
        "id": "n04",
        "title": "SwiftUI Navigation Deep-Dive",
        "image": "https://picsum.photos/seed/navigation/400/240",
        "date": "2025-09-27T13:05:00Z",
        "text": "Patterns for NavigationStack, NavigationDestination, and stable identity.",
        "link": "https://developer.apple.com/documentation/swiftui/navigationstack"
      },
      {
        "id": "n05",
        "title": "Combine Meets Async/Await",
        "image": "https://picsum.photos/seed/combine/400/240",
        "date": "2025-09-26T08:20:00Z",
        "text": "Bridging publishers and async sequences effectively.",
        "link": "https://developer.apple.com/documentation/combine"
      },
      {
        "id": "n06",
        "title": "URLSession Best Practices",
        "image": "https://picsum.photos/seed/urlsession/400/240",
        "date": "2025-09-25T17:10:00Z",
        "text": "Cancellation, timeouts, and efficient image loading.",
        "link": "https://developer.apple.com/documentation/foundation/urlsession"
      },
      {
        "id": "n07",
        "title": "MainActor Explained",
        "image": "https://picsum.photos/seed/mainactor/400/240",
        "date": "2025-09-24T12:00:00Z",
        "text": "Keeping UI updates thread-safe with @MainActor.",
        "link": "https://www.swift.org/documentation/"
      },
      {
        "id": "n08",
        "title": "Swift Macros In Practice",
        "image": "https://picsum.photos/seed/macros/400/240",
        "date": "2025-09-23T15:40:00Z",
        "text": "Reducing boilerplate and keeping code expressive.",
        "link": "https://www.swift.org/blog/"
      },
      {
        "id": "n09",
        "title": "SwiftUI Lists vs LazyVStacks",
        "image": "https://picsum.photos/seed/lists/400/240",
        "date": "2025-09-22T07:50:00Z",
        "text": "Trade-offs between system behaviors and fine-grained control.",
        "link": "https://developer.apple.com/documentation/swiftui/list"
      },
      {
        "id": "n10",
        "title": "Accessibility Quick Wins",
        "image": "https://picsum.photos/seed/a11y/400/240",
        "date": "2025-09-21T10:10:00Z",
        "text": "Labels, traits, and dynamic type done right.",
        "link": "https://developer.apple.com/accessibility/ios/"
      },
      {
        "id": "n11",
        "title": "Swift Performance Tuning",
        "image": "https://picsum.photos/seed/perf/400/240",
        "date": "2025-09-20T09:00:00Z",
        "text": "Inline storage, copy-on-write, and measuring real gains.",
        "link": "https://developer.apple.com/videos/"
      },
      {
        "id": "n12",
        "title": "Diffable Data Sources Revisited",
        "image": "https://picsum.photos/seed/diff/400/240",
        "date": "2025-09-19T14:25:00Z",
        "text": "Stable identity and predictable animations in lists.",
        "link": "https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource"
      },
      {
        "id": "n13",
        "title": "Swift Concurrency Recipes",
        "image": "https://picsum.photos/seed/concurrency/400/240",
        "date": "2025-09-18T11:15:00Z",
        "text": "Task groups, async let, and cancellation patterns.",
        "link": "https://www.swift.org/blog/"
      },
      {
        "id": "n14",
        "title": "JSONDecoder ISO8601 Tips",
        "image": "https://picsum.photos/seed/json/400/240",
        "date": "2025-09-17T16:30:00Z",
        "text": "Date decoding strategies that won’t bite later.",
        "link": "https://developer.apple.com/documentation/foundation/jsondecoder"
      },
      {
        "id": "n15",
        "title": "SwiftUI Preview Speedups",
        "image": "https://picsum.photos/seed/preview/400/240",
        "date": "2025-09-16T09:35:00Z",
        "text": "Trim your preview graphs for instant feedback.",
        "link": "https://developer.apple.com/xcode/swiftui/"
      },
      {
        "id": "n16",
        "title": "App Architecture Field Notes",
        "image": "https://picsum.photos/seed/arch/400/240",
        "date": "2025-09-15T13:45:00Z",
        "text": "Layering features for scale without the ceremony.",
        "link": "https://developer.apple.com/documentation/"
      },
      {
        "id": "n17",
        "title": "Networking Testability",
        "image": "https://picsum.photos/seed/test/400/240",
        "date": "2025-09-14T08:40:00Z",
        "text": "Mocks, fakes, and integration tests that catch regressions.",
        "link": "https://developer.apple.com/documentation/xctest"
      },
      {
        "id": "n18",
        "title": "Metal for iOS Devs",
        "image": "https://picsum.photos/seed/metal/400/240",
        "date": "2025-09-13T18:05:00Z",
        "text": "When and why to go lower-level for graphics.",
        "link": "https://developer.apple.com/metal/"
      },
      {
        "id": "n19",
        "title": "VisionOS SDK Update",
        "image": "https://picsum.photos/seed/vision/400/240",
        "date": "2025-09-12T12:55:00Z",
        "text": "RealityKit integration and input APIs improved.",
        "link": "https://developer.apple.com/visionos/"
      },
      {
        "id": "n20",
        "title": "Privacy & Security Roundup",
        "image": "https://picsum.photos/seed/privacy/400/240",
        "date": "2025-09-11T07:20:00Z",
        "text": "Modern entitlement hygiene and on-device processing.",
        "link": "https://developer.apple.com/security/"
      }
    ]
    """

    static let moviesJSON = """
    [
      {
        "id": "m01",
        "title": "Blade of Dawn",
        "poster": "https://picsum.photos/seed/blade/300/450",
        "overview": "A lone ranger fights the rising darkness at the edge of a forgotten world."
      },
      {
        "id": "m02",
        "title": "Quiet City",
        "poster": "https://picsum.photos/seed/city/300/450",
        "overview": "A minimalist drama set in an empty metropolis."
      },
      {
        "id": "m03",
        "title": "Nova Protocol",
        "poster": "https://picsum.photos/seed/nova/300/450",
        "overview": "A science team uncovers a signal that could change humanity forever."
      },
      {
        "id": "m04",
        "title": "Emberfall",
        "poster": "https://picsum.photos/seed/ember/300/450",
        "overview": "Survivors navigate a city of ash after a mysterious cataclysm."
      },
      {
        "id": "m05",
        "title": "Whispering Pines",
        "poster": "https://picsum.photos/seed/whisper/300/450",
        "overview": "A small town thriller where every secret has deep roots."
      },
      {
        "id": "m06",
        "title": "Horizon Line",
        "poster": "https://picsum.photos/seed/horizon/300/450",
        "overview": "Pilots race a storm across the ocean in a high-wire survival tale."
      },
      {
        "id": "m07",
        "title": "Stormrider",
        "poster": "https://picsum.photos/seed/storm/300/450",
        "overview": "An ex-soldier returns to a homeland under tempest and tyranny."
      },
      {
        "id": "m08",
        "title": "Garden of Glass",
        "poster": "https://picsum.photos/seed/garden/300/450",
        "overview": "An artist restores a shattered legacy through fragile masterpieces."
      },
      {
        "id": "m09",
        "title": "Lighthouse Ward",
        "poster": "https://picsum.photos/seed/lighthouse/300/450",
        "overview": "Two keepers confront the past as a storm isolates their outpost."
      },
      {
        "id": "m10",
        "title": "Neon Avenue",
        "poster": "https://picsum.photos/seed/neon/300/450",
        "overview": "A retro-futurist caper across a sleepless city."
      },
      {
        "id": "m11",
        "title": "Monolith",
        "poster": "https://picsum.photos/seed/monolith/300/450",
        "overview": "Archaeologists unearth a structure that rewrites human history."
      },
      {
        "id": "m12",
        "title": "Redshift",
        "poster": "https://picsum.photos/seed/redshift/300/450",
        "overview": "Smugglers ride solar winds in a chase between orbital stations."
      },
      {
        "id": "m13",
        "title": "Azure Skies",
        "poster": "https://picsum.photos/seed/azure/300/450",
        "overview": "A pilot and a poet chart a course through uncharted currents."
      },
      {
        "id": "m14",
        "title": "Echo Harbor",
        "poster": "https://picsum.photos/seed/echo/300/450",
        "overview": "Mysteries resurface in a seaside town where sounds never die."
      },
      {
        "id": "m15",
        "title": "Midnight Ledger",
        "poster": "https://picsum.photos/seed/midnight/300/450",
        "overview": "Accountants uncover a conspiracy that spans continents."
      },
      {
        "id": "m16",
        "title": "Pilgrim Road",
        "poster": "https://picsum.photos/seed/pilgrim/300/450",
        "overview": "Strangers cross paths on a journey that changes each of them."
      },
      {
        "id": "m17",
        "title": "Oracle’s Path",
        "poster": "https://picsum.photos/seed/oracle/300/450",
        "overview": "A reluctant seer races to prevent a foretold disaster."
      },
      {
        "id": "m18",
        "title": "Drift State",
        "poster": "https://picsum.photos/seed/drift/300/450",
        "overview": "A driver loses time and finds a hidden society between exits."
      },
      {
        "id": "m19",
        "title": "Cascade",
        "poster": "https://picsum.photos/seed/cascade/300/450",
        "overview": "Engineers face a chain reaction in a remote hydro complex."
      },
      {
        "id": "m20",
        "title": "Raven Court",
        "poster": "https://picsum.photos/seed/raven/300/450",
        "overview": "A legal drama where truth is a moving target."
      },
      {
        "id": "m21",
        "title": "Zeal",
        "poster": "https://picsum.photos/seed/zeal/300/450",
        "overview": "A startup cult implodes when a whistleblower speaks up."
      },
      {
        "id": "m22",
        "title": "Halcyon",
        "poster": "https://picsum.photos/seed/halcyon/300/450",
        "overview": "A meditation on memory, loss, and the color of quiet days."
      },
      {
        "id": "m23",
        "title": "Cinder Vale",
        "poster": "https://picsum.photos/seed/cinder/300/450",
        "overview": "A fantasy about rebuilding a village from glowing embers."
      },
      {
        "id": "m24",
        "title": "Tidal Marks",
        "poster": "https://picsum.photos/seed/tidal/300/450",
        "overview": "Divers uncover a map etched into the ocean floor."
      }
    ]
    """
}

