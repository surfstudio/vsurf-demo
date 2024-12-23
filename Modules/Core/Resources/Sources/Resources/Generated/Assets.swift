// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen


#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs


// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
  public enum Colors {
    public enum Buttons {
      public enum Primary {
        public static var disabledBackground: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Primary/disabledBackground")
        }
        public static var disabledText: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Primary/disabledText")
        }
        public static var highlightedBackground: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Primary/highlightedBackground")
        }
        public static var highlightedText: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Primary/highlightedText")
        }
        public static var normalBackground: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Primary/normalBackground")
        }
        public static var normalText: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Primary/normalText")
        }
      }
      public enum Secondary {
        public static var disabledBackground: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Secondary/disabledBackground")
        }
        public static var disabledText: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Secondary/disabledText")
        }
        public static var highlightedBackground: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Secondary/highlightedBackground")
        }
        public static var highlightedText: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Secondary/highlightedText")
        }
        public static var normalBackground: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Secondary/normalBackground")
        }
        public static var normalText: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/Buttons/Secondary/normalText")
        }
      }
    }
    public enum ContainerButton {
      public static var background: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/ContainerButton/background")
      }
      public static var separator: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/ContainerButton/separator")
      }
    }
    public enum Icons {
      public static var primary: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Icons/primary")
      }
      public static var quaternary: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Icons/quaternary")
      }
      public static var secondary: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Icons/secondary")
      }
      public static var tertiary: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Icons/tertiary")
      }
    }
    public enum Loader {
      public static var tint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Loader/tint")
      }
    }
    public enum Main {
      public static var background: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Main/background")
      }
      public static var placeholderBackground: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Main/placeholderBackground")
      }
      public static var placeholderTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Main/placeholderTint")
      }
      public static var separator: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Main/separator")
      }
      public static var systemAction: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Main/systemAction")
      }
    }
    public enum NavigationBar {
      public static var background: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/NavigationBar/background")
      }
      public static var primaryTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/NavigationBar/primaryTint")
      }
      public static var secondaryTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/NavigationBar/secondaryTint")
      }
      public static var text: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/NavigationBar/text")
      }
    }
    public enum PageControl {
      public static var activeIndicatorTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/PageControl/activeIndicatorTint")
      }
      public static var indicatorTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/PageControl/indicatorTint")
      }
    }
    public enum SearchBar {
      public static var background: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/background")
      }
      public static var cancelButton: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/cancelButton")
      }
      public static var clearIconBackground: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/clearIconBackground")
      }
      public static var containerBackground: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/containerBackground")
      }
      public static var placeholder: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/placeholder")
      }
      public static var searchIcon: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/searchIcon")
      }
      public static var text: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/text")
      }
      public static var tint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/SearchBar/tint")
      }
    }
    public enum Snack {
      public static var errorBackground: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Snack/errorBackground")
      }
      public static var successBackground: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Snack/successBackground")
      }
      public static var text: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Snack/text")
      }
    }
    public enum Tabbar {
      public static var background: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Tabbar/background")
      }
      public static var itemTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Tabbar/itemTint")
      }
      public static var selectedItemTint: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Tabbar/selectedItemTint")
      }
      public static var separator: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Tabbar/separator")
      }
    }
    public enum Text {
      public static var primary: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Text/primary")
      }
      public static var secondary: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Text/secondary")
      }
      public static var support: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/Text/support")
      }
    }
    public enum TextInput {
      public enum Toolbar {
        public static var background: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/Toolbar/background")
        }
        public static var separator: ColorAsset {
          ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/Toolbar/separator")
        }
      }
      public static var background: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/background")
      }
      public static var disabled: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/disabled")
      }
      public static var error: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/error")
      }
      public static var normal: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/normal")
      }
      public static var placeholder: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/placeholder")
      }
      public static var success: ColorAsset {
        ColorAsset(name: "\(ColorTheme.current.rawValue)/TextInput/success")
      }
    }
  }
  public enum Images {
    public enum Icons {
      public enum Camera {
        public static let normal = ImageAsset(name: "Icons/Camera/normal")
        public static let small = ImageAsset(name: "Icons/Camera/small")
      }
      public static let arrowRight = ImageAsset(name: "Icons/arrowRight")
      public static let back = ImageAsset(name: "Icons/back")
      public static let check = ImageAsset(name: "Icons/check")
      public static let clear = ImageAsset(name: "Icons/clear")
      public static let close = ImageAsset(name: "Icons/close")
      public static let search = ImageAsset(name: "Icons/search")
      public static let share = ImageAsset(name: "Icons/share")
    }
    public enum Onboarding {
      public static let page1 = ImageAsset(name: "Onboarding/page1")
      public static let page2 = ImageAsset(name: "Onboarding/page2")
      public static let page3 = ImageAsset(name: "Onboarding/page3")
    }
    public enum TabBar {
      public static let main = ImageAsset(name: "TabBar/main")
      public static let profile = ImageAsset(name: "TabBar/profile")
    }
    public enum TextInput {
      public static let arrowDown = ImageAsset(name: "TextInput/arrowDown")
      public static let arrowUp = ImageAsset(name: "TextInput/arrowUp")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var color: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var uiColor: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

@available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
public extension ColorAsset.Color {
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public enum ColorTheme: String, CaseIterable {

  case baseTheme = "BaseTheme"
  case pinkTheme = "PinkTheme"
  case lightBlueTheme = "LightBlueTheme"

  public static var current: ColorTheme = .baseTheme

}

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var image: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var uiImage: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
