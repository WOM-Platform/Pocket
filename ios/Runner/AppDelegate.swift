import Contacts
import ContactsUI
import Flutter
import GoogleMaps
import UIKit

@main
@objc
class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate,
    CNContactViewControllerDelegate
{

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("AIzaSyAOqizuxgO0FPArwrM9zNknHxmDMVx03lY")
        return super.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
    }

    private func creatNewContact(
        result: FlutterResult,
        phone: String,
        name: String,
        email: String,
        url: String
    ) {
        debugPrint("creatNewContact")

        let contact = CNMutableContact.init()
        let homePhone = CNLabeledValue(
            label: CNLabelPhoneNumberMobile,
            value: CNPhoneNumber(stringValue: phone ?? "")
        )
        contact.phoneNumbers = [homePhone]
        contact.urlAddresses = [
            CNLabeledValue(
                label: CNLabelWork,
                value: url as NSString
            )
        ]
        contact.emailAddresses = [
            CNLabeledValue(
                label: CNLabelWork,
                value: email as NSString
            )
        ]
        contact.givenName = name
        let controller = CNContactViewController.init(forNewContact: contact)
        controller.delegate = self
        DispatchQueue.main.async {
            let navigation = UINavigationController.init(
                rootViewController: controller
            )
            let viewController: UIViewController? = UIApplication.shared
                .delegate?.window??.rootViewController
            viewController?.present(navigation, animated: true, completion: nil)
        }
        result(nil)
    }

    func didInitializeImplicitFlutterEngine(
        _ engineBridge: FlutterImplicitEngineBridge
    ) {
        GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

        let contactChannel = FlutterMethodChannel(
            name: "social.wom.pocket/contact",
            binaryMessenger: engineBridge.applicationRegistrar.messenger()
        )

        contactChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void
            in
            // This method is invoked on the UI thread.
            guard call.method == "creatNewContact" else {
                result(FlutterMethodNotImplemented)
                return
            }

            if let args = call.arguments as? [String: String?],
                let name = args["name"] ?? ""
            {

                let email = (args["email"] as? String) ?? ""
                let phone = (args["phone"] as? String) ?? ""
                let url = (args["url"] as? String) ?? ""

                self?.creatNewContact(
                    result: result,
                    phone: phone,
                    name: name,
                    email: email,
                    url: url
                )
            } else {
                debugPrint("Missing args: ")
            }
        })
    }

}
