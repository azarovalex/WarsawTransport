//
//  SecretsProvider.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/10/23.
//

import Foundation
import Dependencies

struct SecretsProvider {
    enum SecretKey {
        case ztmAPIKey

        fileprivate var plistKey: String {
            switch self {
            case .ztmAPIKey:
                "ZTMAPIKey"
            }
        }
    }
    var getSecret: (_ key: SecretKey) -> String
}

extension SecretsProvider: DependencyKey {
    static let liveValue: Self = {
        var cachedSecrets = [SecretKey: String]()
        let lock = NSLock()
        return Self { key in
            lock.lock()
            defer { lock.unlock() }
            if let secret = cachedSecrets[key] {
                return secret
            }
            let secret = Bundle.main.infoDictionary![key.plistKey] as! String
            cachedSecrets[key] = secret
            return secret
        }
    }()
}

extension DependencyValues {
    var secretsProvider: SecretsProvider {
        get { self[SecretsProvider.self] }
        set { self[SecretsProvider.self] = newValue }
    }
}
