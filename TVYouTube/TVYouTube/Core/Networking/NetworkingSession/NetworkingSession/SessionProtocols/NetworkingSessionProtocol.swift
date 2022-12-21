//
//  NetworkingSessionProtocol.swift
//  NetworkingAlamofireSolution
//
//  Created by Nikita Omelchenko on 20.10.2021.
//

import Foundation
import Alamofire

// MARK: - Networking Session Protocol
public protocol NetworkingSessionProtocol: AnyObject {
    var sessionManager: Session { get }
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }

    var authCredential: OAuthAuthenticator.OAuthCredential? { get set }
    var authDelegate: OAuthAuthenticatorDelegate? { get set }
    var interceptorDelegate: InterceptorDelegate? { get set }

    func request(_ type: NetworkingRouterProtocol) -> DataRequest?
    func objectfromData<T: Decodable>(_ data: Data) -> T?
    func responseData<T: Decodable>(_ response: AFDataResponse<Data>) -> Result<T, Error>
}
