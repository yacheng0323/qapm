import Flutter
import UIKit
import Foundation

public class QapmPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "qapm_channel", binaryMessenger: registrar.messenger())
    let instance = QapmPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "qapm":
        if let dict = call.arguments as? [String: Any] {
          if let deviceId = dict["deviceId"] as? String {
            QAPMConfig.getInstance().deviceID = deviceId
          }
          if let userId = dict["userId"] as? String {
              QAPMConfig.getInstance().userId = userId
          }
          if let customerAppVersion = dict["customerAppVersion"] as? String {
              QAPMConfig.getInstance().customerAppVersion = customerAppVersion
          }
          if let appKey = dict["appKey"] as? String {
            QAPMConfig.getInstance().collectOptionalFields = true
            print("qapm sdk version: \(QAPM.sdkVersion())")
            // QAPM.registerLogCallback { level, log in
            //   #if DEBUG
            //     if let log = log {
            //       print("QAPM: \(String(cString: log))")
            //     }
            //   #endif
            // }
            QAPMConfig.getInstance().host = "https://app.rumt-sg.com"
            QAPMModelStableConfig.getInstance().setupModelAll()
            QAPM.start(withAppKey: appKey)
          }
          result(nil)
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid argument", details: nil))
        }
      case "customEvent":
        handleCustomEvent(call, result: result)
      default:
        result(FlutterMethodNotImplemented)
    }
  }

  private func handleCustomEvent(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   if let dict = call.arguments as? [String: Any],
      let category = dict["category"] as? String,
      let tags = dict["tags"] as? [String: String],
      let values = dict["values"] as? [String: NSNumber] {
      let eventUUID = QAPMUBSMonitor.manager().customEvent(category, tags: tags, values: values)
      if let eventUUID = eventUUID {
         result(eventUUID)
      } else {
         result(FlutterError(code: "EVENT_CREATION_FAILED", message: "Failed to create custom event", details: nil))
      }
   } else {
      result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid argument", details: nil))
   }
}
}
