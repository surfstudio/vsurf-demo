//
//  Copyright © Surf. All rights reserved.
//

extension CityEntity: Equatable {

    public static func == (lhs: CityEntity, rhs: CityEntity) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.position == rhs.position
    }

}
