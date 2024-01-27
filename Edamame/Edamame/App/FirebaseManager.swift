//
//  FirebaseManager.swift
//  Edamame
//
//  Created by Bedri Doğan on 27.01.2024.
//

import Foundation
import FirebaseAuth

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

    private func sendEmailVerification(completion: @escaping (Result<String, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No user is signed in"])))
            return
        }

        user.sendEmailVerification { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Email verification sent successfully!"))
            }
        }
    }
}
