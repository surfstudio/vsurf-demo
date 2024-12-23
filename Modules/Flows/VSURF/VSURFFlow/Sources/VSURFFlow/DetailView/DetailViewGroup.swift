//
//  DetailViewGroup.swift
//  VSURFFlow
//
//  Created by Nikita Korobeinikov on 18.11.2024.
//

import VSURFState
import SwiftUI

struct DetailViewGroup: View {

    // MARK: - State

    @StateObject private var stateHolder: DetailViewStateHolder

    // MARK: - Init

    init(item: String, cartUnit: CartUnitInput & CartUnitOutput) {
        _stateHolder = .init(wrappedValue: .init(item: item,
                                                 cartUnit: cartUnit))
    }

    // MARK: - View

    var body: some View {
        DetailView(state: $stateHolder.state)
            .weakReference(stateHolder, as: DetailViewOutput.self)
    }
}
