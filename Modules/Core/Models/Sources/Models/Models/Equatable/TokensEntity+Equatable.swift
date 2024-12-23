//
//  Copyright © Surf. All rights reserved.
//

extension TokensEntity: Equatable {
    public static func == (lhs: TokensEntity, rhs: TokensEntity) -> Bool {
        lhs.accessToken == rhs.accessToken &&
            lhs.refreshToken == rhs.refreshToken
    }
}
