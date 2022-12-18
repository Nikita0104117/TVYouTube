import Foundation
import Network
import Alamofire

enum ApiURLsPath: String {
    case baseUrl = "http://localhost:3001/"
}

final class RestClient: NetworkingSession, InterceptorDelegate {
    override init(baseURL: String) {
        super.init(baseURL: baseURL)

        self.interceptorDelegate = self
    }

    static func isConnectedToInternet() -> Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }

    func retry(_ request: Request, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}

// MARK: - OAuth Authenticator Delegate
extension TokenManager: OAuthAuthenticatorDelegate { }

// MARK: - Token Manager Networking Router Protocol
extension TokenManager.TokenRouter: NetworkingRouterProtocol {
    public var path: Endpoint { "" }
}

// MARK: - Response Models
enum ResponseModels { }

// MARK: - Request Models
enum RequestModels { }

// MARK: - Custom Error
public enum NetworkError: Error {
    case customError(String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .customError(let string):
                return string
        }
    }
}
