import SwiftUI
import SurfCore

struct TutorView: View {

    @WeakReference var signal: TutorSignal?

    var body: some View {
        VStack(alignment: .center,
               content: {
            Button(action: {
                signal?.onTutorCompleted()
            }, label: {
                Text("Завершить")
            })
            Button(action: {
                signal?.onTutorCancelled()
            }, label: {
                Text("Пропустить")
            })
        })
    }
}
