//
//  ViewController.swift
//  NativeBarode
//

//

import UIKit
import BarcodeGenerater

class ViewController: UIViewController {
    @IBOutlet var rewardsCheckBarcodeImageView: UIImageView!

    @IBOutlet var firstBarcodeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstBarcodeImageView.image = BarcodeImageGenerater().generateBarcode("5095013750")
        rewardsCheckBarcodeImageView.image =  BarcodeImageGenerater().generateBarcode("58262686648385163")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

