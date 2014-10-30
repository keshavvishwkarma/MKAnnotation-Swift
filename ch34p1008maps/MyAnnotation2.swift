
import UIKit
import MapKit

class MyAnnotation2 : NSObject, MKAnnotation, Printable {
    
    var coordinate: CLLocationCoordinate2D
    var title: String = ""
    var subtitle: String = ""
    override var description: String {
        get {
            return "MyAnnotation2"
        }
    }
    
    init(location coord:CLLocationCoordinate2D) {
        self.coordinate = coord
        super.init()
    }

}
