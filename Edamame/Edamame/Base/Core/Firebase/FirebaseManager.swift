//
//  FirebaseManager.swift
//  Edamame
//
//  Created by Bedri Doğan on 27.01.2024.
//


import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class FirebaseManager {
    static let shared = FirebaseManager()

    init() {}
    
    func signUp(email: String, password: String, completion: @escaping (Result<User?, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(authResult?.user))
            }
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Sign-in successful!"))
            }
        }
    }
}



//extension FirebaseManager {
//    func loginWithGoogle(_ email: String?, password: String?) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)
//        GIDSignIn.sharedInstance.configuration = config
//        
//        // Start the sign in flow!
//        GIDSignIn.
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
//            guard error == nil else {
//                // ...
//            }
//            
//            guard let user = result?.user,
//                  let idToken = user.idToken?.tokenString
//            else {
//                // ...
//            }
//            
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: user.accessToken.tokenString)
//            
//            Auth.auth().signIn(with: credential) { result, error in
//
//              // At this point, our user is signed in
//            }
//            // ...
//        }
//    }
//}
