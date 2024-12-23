//
//  Copyright © Surf. All rights reserved.
//

import Foundation
import SurfCore
import UIKit

public final class TimerManager {

    // MARK: - Properties

    /// Замыкание, вызывается каждый раз, когда время таймера изменяется
    /// - parameter - кол-во оставшихся секунд до конца таймера
    /// (в случае возвращение приложения из бэкграунда - может быть отрицательно)
    public var onTimeChanged: Closure<Int>?
    public private(set) var secondsLeft = 0

    // MARK: - Private Properties

    private var timer: Timer?
    private var startDate: Date?
    private let initialSeconds: Int

    // MARK: - Initializaion

    public init(seconds: Int) {
        self.initialSeconds = seconds
        self.secondsLeft = seconds
        addNotifications()
    }

    // MARK: - Public Methods

    public func startTimer() {
        startDate = Date()
        fireTimeClosure()

        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.secondsLeft -= 1
            self?.fireTimeClosure()
        }
        self.timer = timer
        RunLoop.main.add(timer, forMode: .common)
    }

    public func stopTimer() {
        timer?.invalidate()
        startDate = nil
    }

}

// MARK: - Private Methods

private extension TimerManager {

    func fireTimeClosure() {
        onTimeChanged?(secondsLeft)
        if secondsLeft <= 0 {
            stopTimer()
        }
    }

}

// MARK: - Notifications

private extension TimerManager {

    func addNotifications() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(appMovedFromBackground),
                         name: UIApplication.didBecomeActiveNotification,
                         object: nil)
    }

    @objc
    func appMovedFromBackground() {
        guard
            let startDate,
            let seconds = Calendar.current.dateComponents([.second], from: startDate, to: Date()).second
        else {
            return
        }
        secondsLeft = initialSeconds - seconds
        fireTimeClosure()
    }

}
