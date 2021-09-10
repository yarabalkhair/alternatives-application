import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let ocrChannel = FlutterMethodChannel(name: "ocr_scan",
                                              binaryMessenger: controller.binaryMessenger)
    
    ocrChannel.setMethodCallHandler({
               (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
                print(call.method)
                switch(call.method) {
                case "scan" :
                    //Go to new VC
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    if let vc = storyboard.instantiateViewController(withIdentifier: "scan") as? ViewController {
                        controller.present(vc, animated: true, completion: nil)
                                           vc.completionHandler = { code in
                                               // this will be executed when `someButtonTapped(_:)` will be called
                                               result(code)
                                           }
                    }
                   
                   
                    
                default:
                    break
                }
               
           })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


