//
//  LogInViewController.swift
//  
//
//  Created by Ahmed Madeh on 2/6/18.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var logInButton: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField{
            passwordField.becomeFirstResponder()
            
            
        }else{
            logInButton.sendActions(for: .touchUpInside)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      if  !(touches.first?.view! is UITextField){
             touches.first?.view?.resignFirstResponder()
        }
    }
    @IBAction func clickLogInButton(_ sender: Any) {
       //Login{email,password,device_token}
        var pars : Parameters = [:]
        pars["email"] = emailField.text
        pars["password"] = passwordField.text
        pars["device_token"] = "12334"
        
        Alamofire.request("http://72.52.132.61/~travelse/travelSense/login.php", method: .post, parameters: pars, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let json = response.result.value {
                    print("JSON: \(json)")
                } else {
                    print("Did not receive json")
                }
                
              
            
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.delegate = self
        emailField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
