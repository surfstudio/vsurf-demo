//
//  Copyright © Surf. All rights reserved.
//

extension UserProfileEntity: Equatable {
    public static func == (lhs: UserProfileEntity, rhs: UserProfileEntity) -> Bool {
        lhs.birthday == rhs.birthday &&
            lhs.email == rhs.email &&
            lhs.firstName == rhs.firstName &&
            lhs.id == rhs.id &&
            lhs.lastName == rhs.lastName &&
            lhs.phone == rhs.phone &&
            lhs.sex == rhs.sex
    }
}
