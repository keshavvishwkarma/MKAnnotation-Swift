
import UIKit
import MapKit

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map : MKMapView!
    var annloc : CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.map.tintColor = UIColor.greenColor()
        
        let loc = CLLocationCoordinate2DMake(34.927752,-120.217608)
        let span = MKCoordinateSpanMake(0.015, 0.015)
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
        self.annloc = CLLocationCoordinate2DMake(34.923964,-120.219558)
        
        let ann = MyAnnotation(location:self.annloc)
        self.map.addAnnotation(ann)
        var loc2 = ann.coordinate
        loc2.latitude = loc.latitude + 0.0005
        loc2.longitude = loc.longitude + 0.001
        let ann2 = MyAnnotation2(location:loc2)
        self.map.addAnnotation(ann2)
        println(self.map.annotations)
    }

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            var v : MKAnnotationView! = nil
            if annotation is MyAnnotation || annotation is MyAnnotation2 {
                let ident = "bike"
                v = mapView.dequeueReusableAnnotationViewWithIdentifier(ident)
                if v == nil {
                    v = MyAnnotationView(annotation:annotation, reuseIdentifier:ident)
                }
                v.annotation = annotation
            }
            return v
    }
    

}
