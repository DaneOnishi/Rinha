import SwiftUI
import CoreMotion

class MotionObserver: ObservableObject {
    @Published var motionManager = CMMotionManager()
    
    init() {
        fetchMotionData()
    }
    
    @Published var yaw : CGFloat = 0
    @Published var roll : CGFloat = 0
    
    func fetchMotionData() {
        motionManager.startDeviceMotionUpdates(to: .main) {
            data, err in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("ERROR IN DATA")
                return
            }
            
            self.yaw = data.attitude.yaw * 100

            self.roll = data.attitude.roll * 100
        }
    }
}
