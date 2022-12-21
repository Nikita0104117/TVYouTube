//
//  NetworkingSession.swift
//  NetworkingAlamofireSolution
//
//  Created by Nikita Omelchenko on 18.10.2021.
//

import Foundation
import Alamofire

// MARK: - Networking Session
open class NetworkingSession: NetworkingSessionProtocol {
    // MARK: - Public Properties
    public var authCredential: OAuthAuthenticator.OAuthCredential? {
        didSet {
            guard
                let authCredential = authCredential
            else {
                authInterceptor = nil
                return
            }

            authInterceptor = .init(authenticator: authenticator, credential: authCredential)
        }
    }

    // MARK: - Public Delegates
    public weak var authDelegate: OAuthAuthenticatorDelegate? {
        didSet {
            authenticator.delegate = authDelegate
        }
    }

    public weak var interceptorDelegate: InterceptorDelegate? {
        didSet {
            requestInterceptor.delegate = interceptorDelegate
        }
    }

    // MARK: - Public Private(set) Properties
    public private(set) var sessionManager: Session

    public private(set) var decoder: JSONDecoder = JSONDecoder()
    public private(set) var encoder: JSONEncoder = JSONEncoder()

    // MARK: - Private Properties
    private var baseURL: URL?

    private let eventMonitor: BaseEventMonitor = .init()
    private let requestInterceptor: BaseRequestInterceptor = .init()

    private let rootQueue: DispatchQueue
    private let requestQueue: DispatchQueue
    private let serializationQueue: DispatchQueue
    private let configuration: URLSessionConfiguration

    private let authenticator = OAuthAuthenticator()
    private var authInterceptor: AuthenticationInterceptor<OAuthAuthenticator>?

    // MARK: - Public Init
    public init(baseURL: String) {
        self.baseURL = URL(string: baseURL)

        self.rootQueue = DispatchQueue(label: "\(baseURL).\(Bundle.main.bundleIdentifier ?? "").rootQueue")
        self.requestQueue = DispatchQueue(label: "\(baseURL).\(Bundle.main.bundleIdentifier ?? "").requestQueue")
        self.serializationQueue = DispatchQueue(label: "\(baseURL).\(Bundle.main.bundleIdentifier ?? "").serializationQueue")

        self.configuration = URLSessionConfiguration.af.default
        self.configuration.timeoutIntervalForRequest = 30
        self.configuration.waitsForConnectivity = true
        self.configuration.requestCachePolicy = .reloadRevalidatingCacheData

        self.sessionManager = .init(
            configuration: configuration,
            rootQueue: rootQueue,
            startRequestsImmediately: true,
            requestQueue: requestQueue,
            serializationQueue: serializationQueue,
            interceptor: requestInterceptor,
            cachedResponseHandler: ResponseCacher(behavior: .cache),
            eventMonitors: [ eventMonitor ]
        )

        self.commonSetup()
    }
}

// MARK: - Public Functions
public extension NetworkingSession {
    func request(_ type: NetworkingRouterProtocol) -> DataRequest? {
        guard let baseURL = baseURL else { return nil }

        let parameters: Parameters? = type.parameters?.asDictionary(encoder: self.encoder)

        return sessionManager.request(
            baseURL.appendingPathComponent(type.path),
            method: type.method,
            parameters: parameters,
            encoding: type.encoder,
            headers: type.headers,
            interceptor: type.addAuth ? authInterceptor : nil
        )
    }

    func objectfromData<T: Decodable>(_ data: Data) -> T? {
        do {
            let object = try self.decoder.decode(T.self, from: data)
            return object
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }

    func responseData<T: Decodable>(_ response: AFDataResponse<Data>) -> Result<T, Error> {
        let errorsKey: String = "errors"

        switch response.result {
            case .success(let data):
                guard
                    let responseType = response.response?.status?.responseType
                else {
                    return .failure(URLError(.badServerResponse))
                }

                switch responseType {
                    case .clientError, .serverError:
                        guard
                            let errorObject = data.convertToDictionary(),
                            let errors = errorObject[errorsKey] as? [String: [String]]
                        else {
                            return .failure(URLError(.badServerResponse))
                        }

                        let errorString = errors.values.flatMap({ $0 }).joined(separator: "\n")
                        let error: Error = NetworkError.customError(errorString)

                        return .failure(error)

                    default:
                        break
                }

                guard
                    let object: T = self.objectfromData(data)
                else {
                    return .failure(URLError(.badServerResponse))
                }

                return .success(object)
            case .failure(let error):
                return .failure(error)
        }
    }
}

// MARK: - Private Functions
extension NetworkingSession {
    private func commonSetup() {
        configurateDecoder()
        configurateEncoder()
    }

    private func configurateDecoder() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
    }

    private func configurateEncoder() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .secondsSince1970
        encoder.outputFormatting = .prettyPrinted
    }
}

// MARK: - Custom Error
public enum NetworkError: Error {
    case customError(String)
}

private extension Encodable {
    func asDictionary(encoder: JSONEncoder) -> [String: Any]? {
        do {
            let data = try encoder.encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]

            return dictionary
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
