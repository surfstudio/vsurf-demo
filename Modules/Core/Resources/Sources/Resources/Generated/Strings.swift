// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Localizable {
    public enum AboutApp {
      /// About the app
      public static let title = L10n.tr("Localizable", "AboutApp.title", fallback: "About the app")
      /// Version %@
      public static func version(_ p1: Any) -> String {
        return L10n.tr("Localizable", "AboutApp.version", String(describing: p1), fallback: "Version %@")
      }
    }
    public enum City {
      public enum SearchBar {
        /// Find your city
        public static let placeholder = L10n.tr("Localizable", "City.SearchBar.Placeholder", fallback: "Find your city")
      }
      public enum Selection {
        /// Selecting the city
        public static let title = L10n.tr("Localizable", "City.Selection.title", fallback: "Selecting the city")
      }
    }
    public enum Confirmation {
      public enum Auth {
        /// An SMS containing a verification code was sent to **%@**
        public static func description(_ p1: Any) -> String {
          return L10n.tr("Localizable", "Confirmation.Auth.description", String(describing: p1), fallback: "An SMS containing a verification code was sent to **%@**")
        }
        /// Send new code
        public static let sendCode = L10n.tr("Localizable", "Confirmation.Auth.sendCode", fallback: "Send new code")
        /// Please enter
        /// the SMS code.
        public static let title = L10n.tr("Localizable", "Confirmation.Auth.title", fallback: "Please enter\nthe SMS code.")
        /// Send new code in %@
        public static func waitCode(_ p1: Any) -> String {
          return L10n.tr("Localizable", "Confirmation.Auth.waitCode", String(describing: p1), fallback: "Send new code in %@")
        }
      }
    }
    public enum DefaultCity {
      /// Moscow
      public static let name = L10n.tr("Localizable", "DefaultCity.name", fallback: "Moscow")
    }
    public enum DeliveryTerms {
      /// Delivery and payment
      public static let title = L10n.tr("Localizable", "DeliveryTerms.title", fallback: "Delivery and payment")
    }
    public enum EmptyState {
      public enum Shared {
        /// Try again later
        public static let description = L10n.tr("Localizable", "EmptyState.Shared.description", fallback: "Try again later")
        /// Oops! It's empty
        public static let title = L10n.tr("Localizable", "EmptyState.Shared.title", fallback: "Oops! It's empty")
      }
    }
    public enum Error {
      /// Something went wrong. Try again later
      public static let `default` = L10n.tr("Localizable", "Error.default", fallback: "Something went wrong. Try again later")
      /// Something went wrong... Please try getting authorized again
      public static let forceLogout = L10n.tr("Localizable", "Error.ForceLogout", fallback: "Something went wrong... Please try getting authorized again")
      /// We couldn't follow the link. Please try again later
      public static let invalidUrl = L10n.tr("Localizable", "Error.invalidUrl", fallback: "We couldn't follow the link. Please try again later")
      /// Connection failed. Please check your network connection, then try again
      public static let noInternetConnection = L10n.tr("Localizable", "Error.noInternetConnection", fallback: "Connection failed. Please check your network connection, then try again")
      /// The code you have entered is invalid. Please try again
      public static let otpCodeInvalid = L10n.tr("Localizable", "Error.OTPCodeInvalid", fallback: "The code you have entered is invalid. Please try again")
      /// You have run out of attempts. Please try again later and contact support if the issue persists
      public static let otpCodeRequestsTooMany = L10n.tr("Localizable", "Error.OTPCodeRequestsTooMany", fallback: "You have run out of attempts. Please try again later and contact support if the issue persists")
      /// The access is temporarily blocked. Please try again later and contact support if the issue persists
      public static let userBlocked = L10n.tr("Localizable", "Error.UserBlocked", fallback: "The access is temporarily blocked. Please try again later and contact support if the issue persists")
      public enum MultiStates {
        public enum Internet {
          /// Refresh
          public static let button = L10n.tr("Localizable", "Error.MultiStates.Internet.button", fallback: "Refresh")
          /// Please check your network connection and try again
          public static let message = L10n.tr("Localizable", "Error.MultiStates.Internet.message", fallback: "Please check your network connection and try again")
          /// Connection failed
          public static let title = L10n.tr("Localizable", "Error.MultiStates.Internet.title", fallback: "Connection failed")
        }
        public enum Other {
          /// Refresh
          public static let button = L10n.tr("Localizable", "Error.MultiStates.Other.button", fallback: "Refresh")
          /// Try refreshing the page
          public static let message = L10n.tr("Localizable", "Error.MultiStates.Other.message", fallback: "Try refreshing the page")
          /// Something went wrong
          public static let title = L10n.tr("Localizable", "Error.MultiStates.Other.title", fallback: "Something went wrong")
        }
      }
    }
    public enum Information {
      /// Information
      public static let title = L10n.tr("Localizable", "Information.title", fallback: "Information")
      public enum Items {
        /// About the app
        public static let aboutApp = L10n.tr("Localizable", "Information.Items.aboutApp", fallback: "About the app")
        /// Contacts and payment details
        public static let contacts = L10n.tr("Localizable", "Information.Items.contacts", fallback: "Contacts and payment details")
        /// Privacy policy
        public static let dataPolicy = L10n.tr("Localizable", "Information.Items.dataPolicy", fallback: "Privacy policy")
        /// User agreement
        public static let termsOfUse = L10n.tr("Localizable", "Information.Items.termsOfUse", fallback: "User agreement")
      }
    }
    public enum Login {
      /// Request code
      public static let actionButton = L10n.tr("Localizable", "Login.actionButton", fallback: "Request code")
      /// Enter your mobile number
      public static let description = L10n.tr("Localizable", "Login.description", fallback: "Enter your mobile number")
      /// Log in or register
      public static let title = L10n.tr("Localizable", "Login.title", fallback: "Log in or register")
      public enum Terms {
        /// By pressing «Request code« I accept 
        public static let part1 = L10n.tr("Localizable", "Login.Terms.part1", fallback: "By pressing «Request code« I accept ")
        /// the Privacy policy
        public static let part2 = L10n.tr("Localizable", "Login.Terms.part2", fallback: "the Privacy policy")
      }
    }
    public enum Main {
      /// You can select a city
      public static let hint = L10n.tr("Localizable", "Main.hint", fallback: "You can select a city")
      /// Main screen
      public static let title = L10n.tr("Localizable", "Main.title", fallback: "Main screen")
    }
    public enum Onboarding {
      public enum Button {
        /// Next
        public static let next = L10n.tr("Localizable", "Onboarding.Button.next", fallback: "Next")
        /// Select the city
        public static let selectCity = L10n.tr("Localizable", "Onboarding.Button.selectCity", fallback: "Select the city")
      }
      public enum Page1 {
        /// Our store provides a large selection of practical goods at the most affordable price!
        public static let message = L10n.tr("Localizable", "Onboarding.Page1.message", fallback: "Our store provides a large selection of practical goods at the most affordable price!")
        /// Page one title
        public static let title = L10n.tr("Localizable", "Onboarding.Page1.title", fallback: "Page one title")
      }
      public enum Page2 {
        /// Our store provides a large selection of practical goods at the most affordable price!
        public static let message = L10n.tr("Localizable", "Onboarding.Page2.message", fallback: "Our store provides a large selection of practical goods at the most affordable price!")
        /// Page two title
        public static let title = L10n.tr("Localizable", "Onboarding.Page2.title", fallback: "Page two title")
      }
      public enum Page3 {
        /// Our store provides a large selection of practical goods at the most affordable price!
        public static let message = L10n.tr("Localizable", "Onboarding.Page3.message", fallback: "Our store provides a large selection of practical goods at the most affordable price!")
        /// Page three title
        public static let title = L10n.tr("Localizable", "Onboarding.Page3.title", fallback: "Page three title")
      }
    }
    public enum PhotoViewer {
      /// %d out of %d
      public static func title(_ p1: Int, _ p2: Int) -> String {
        return L10n.tr("Localizable", "PhotoViewer.title", p1, p2, fallback: "%d out of %d")
      }
    }
    public enum Profile {
      public enum Auth {
        /// My data
        public static let subtitle = L10n.tr("Localizable", "Profile.Auth.subtitle", fallback: "My data")
      }
      public enum Contacts {
        /// Support chat
        public static let barTitle = L10n.tr("Localizable", "Profile.Contacts.barTitle", fallback: "Support chat")
      }
      public enum Logout {
        public enum Warning {
          /// Leave
          public static let action = L10n.tr("Localizable", "Profile.Logout.Warning.action", fallback: "Leave")
          /// Are you sure you want to leave your account?
          public static let text = L10n.tr("Localizable", "Profile.Logout.Warning.text", fallback: "Are you sure you want to leave your account?")
        }
      }
      public enum Menu {
        /// City
        public static let city = L10n.tr("Localizable", "Profile.Menu.city", fallback: "City")
        /// Support chat
        public static let contacts = L10n.tr("Localizable", "Profile.Menu.contacts", fallback: "Support chat")
        /// Delivery and payment
        public static let delivery = L10n.tr("Localizable", "Profile.Menu.delivery", fallback: "Delivery and payment")
        /// Information
        public static let information = L10n.tr("Localizable", "Profile.Menu.information", fallback: "Information")
        /// Log out
        public static let logout = L10n.tr("Localizable", "Profile.Menu.logout", fallback: "Log out")
        /// My orders
        public static let orders = L10n.tr("Localizable", "Profile.Menu.orders", fallback: "My orders")
        /// Shops
        public static let shops = L10n.tr("Localizable", "Profile.Menu.shops", fallback: "Shops")
      }
      public enum UnAuth {
        /// Log in
        public static let action = L10n.tr("Localizable", "Profile.UnAuth.action", fallback: "Log in")
        /// Log in or register
        public static let title = L10n.tr("Localizable", "Profile.UnAuth.title", fallback: "Log in or register")
      }
      public enum UserData {
        /// Delete account
        public static let deleteUser = L10n.tr("Localizable", "Profile.UserData.deleteUser", fallback: "Delete account")
        /// Save
        public static let saveAction = L10n.tr("Localizable", "Profile.UserData.SaveAction", fallback: "Save")
        /// My data
        public static let title = L10n.tr("Localizable", "Profile.UserData.title", fallback: "My data")
        public enum ChangePhone {
          /// Continue
          public static let action = L10n.tr("Localizable", "Profile.UserData.ChangePhone.action", fallback: "Continue")
          /// To change the number, you have to contact our customer support
          public static let description = L10n.tr("Localizable", "Profile.UserData.ChangePhone.description", fallback: "To change the number, you have to contact our customer support")
          /// Note!
          public static let title = L10n.tr("Localizable", "Profile.UserData.ChangePhone.title", fallback: "Note!")
        }
        public enum SaveData {
          /// Data saved successfully
          public static let success = L10n.tr("Localizable", "Profile.UserData.SaveData.success", fallback: "Data saved successfully")
        }
        public enum Sex {
          /// Female
          public static let female = L10n.tr("Localizable", "Profile.UserData.Sex.female", fallback: "Female")
          /// Male
          public static let male = L10n.tr("Localizable", "Profile.UserData.Sex.male", fallback: "Male")
          /// Sex
          public static let title = L10n.tr("Localizable", "Profile.UserData.Sex.title", fallback: "Sex")
        }
        public enum Snack {
          public enum Delete {
            /// Your account will be deleted in 7 days
            public static let success = L10n.tr("Localizable", "Profile.UserData.Snack.Delete.success", fallback: "Your account will be deleted in 7 days")
          }
          public enum Save {
            /// We couldn't save it. Please try again
            public static let falied = L10n.tr("Localizable", "Profile.UserData.Snack.Save.falied", fallback: "We couldn't save it. Please try again")
          }
        }
        public enum Warning {
          public enum Delete {
            /// Delete
            public static let action = L10n.tr("Localizable", "Profile.UserData.Warning.Delete.action", fallback: "Delete")
            /// All your orders and data will be deleted with no chance to recover
            public static let description = L10n.tr("Localizable", "Profile.UserData.Warning.Delete.description", fallback: "All your orders and data will be deleted with no chance to recover")
            /// Are you sure you want to delete your account?
            public static let title = L10n.tr("Localizable", "Profile.UserData.Warning.Delete.title", fallback: "Are you sure you want to delete your account?")
          }
        }
      }
    }
    public enum Shared {
      public enum Action {
        /// Cancel
        public static let cancel = L10n.tr("Localizable", "Shared.Action.cancel", fallback: "Cancel")
        /// Close
        public static let close = L10n.tr("Localizable", "Shared.Action.close", fallback: "Close")
      }
      public enum MultiStates {
        public enum Empty {
          public enum CitySearch {
            /// Please double-check your spelling of the location
            public static let message = L10n.tr("Localizable", "Shared.MultiStates.Empty.CitySearch.message", fallback: "Please double-check your spelling of the location")
            /// Nothing found
            public static let title = L10n.tr("Localizable", "Shared.MultiStates.Empty.CitySearch.title", fallback: "Nothing found")
          }
        }
      }
      public enum Tabbar {
        /// Home
        public static let main = L10n.tr("Localizable", "Shared.Tabbar.main", fallback: "Home")
        /// Profile
        public static let profile = L10n.tr("Localizable", "Shared.Tabbar.profile", fallback: "Profile")
      }
    }
    public enum TextFields {
      /// Date of birth
      public static let birthday = L10n.tr("Localizable", "TextFields.birthday", fallback: "Date of birth")
      /// E-mail
      public static let email = L10n.tr("Localizable", "TextFields.email", fallback: "E-mail")
      /// This field is empty
      public static let emptyError = L10n.tr("Localizable", "TextFields.emptyError", fallback: "This field is empty")
      /// Please complete this field
      public static let lengthError = L10n.tr("Localizable", "TextFields.lengthError", fallback: "Please complete this field")
      /// First name
      public static let name = L10n.tr("Localizable", "TextFields.name", fallback: "First name")
      /// Phone number
      public static let phone = L10n.tr("Localizable", "TextFields.phone", fallback: "Phone number")
      /// Enter promo code
      public static let promocode = L10n.tr("Localizable", "TextFields.promocode", fallback: "Enter promo code")
      /// This field is required
      public static let requiredError = L10n.tr("Localizable", "TextFields.requiredError", fallback: "This field is required")
      /// Sex
      public static let sex = L10n.tr("Localizable", "TextFields.sex", fallback: "Sex")
      /// Last name
      public static let surname = L10n.tr("Localizable", "TextFields.surname", fallback: "Last name")
      /// Wrong format
      public static let validationError = L10n.tr("Localizable", "TextFields.validationError", fallback: "Wrong format")
      public enum Checkout {
        /// Commentary about the order
        public static let comment = L10n.tr("Localizable", "TextFields.Checkout.comment", fallback: "Commentary about the order")
      }
      public enum Toolbar {
        /// Done
        public static let doneButton = L10n.tr("Localizable", "TextFields.Toolbar.doneButton", fallback: "Done")
      }
    }
  }
  public enum LocalizablePlural {
    public enum Time {
      public enum After {
        /// Plural format key: "%#@Minutes@"
        public static func minutes(_ p1: Int) -> String {
          return L10n.tr("LocalizablePlural", "Time.After.minutes", p1, fallback: "Plural format key: \"%#@Minutes@\"")
        }
        /// Plural format key: "%#@Seconds@"
        public static func seconds(_ p1: Int) -> String {
          return L10n.tr("LocalizablePlural", "Time.After.seconds", p1, fallback: "Plural format key: \"%#@Seconds@\"")
        }
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
