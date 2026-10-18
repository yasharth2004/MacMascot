import Foundation
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "Mascot" asset catalog image resource.
    static let mascot = DeveloperToolsSupport.ImageResource(name: "Mascot", bundle: resourceBundle)

    /// The "pic1" asset catalog image resource.
    static let pic1 = DeveloperToolsSupport.ImageResource(name: "pic1", bundle: resourceBundle)

    /// The "pic2" asset catalog image resource.
    static let pic2 = DeveloperToolsSupport.ImageResource(name: "pic2", bundle: resourceBundle)

    /// The "pic3" asset catalog image resource.
    static let pic3 = DeveloperToolsSupport.ImageResource(name: "pic3", bundle: resourceBundle)

    /// The "pic7" asset catalog image resource.
    static let pic7 = DeveloperToolsSupport.ImageResource(name: "pic7", bundle: resourceBundle)

    /// The "pic8" asset catalog image resource.
    static let pic8 = DeveloperToolsSupport.ImageResource(name: "pic8", bundle: resourceBundle)

    /// The "pic9" asset catalog image resource.
    static let pic9 = DeveloperToolsSupport.ImageResource(name: "pic9", bundle: resourceBundle)

}

