//
//  SSHConfigurationTests.swift
//  TableProTests
//

import Foundation
@testable import TablePro
import Testing

@Suite("SSH Configuration Validation")
struct SSHConfigurationTests {
    @Test("Agent auth is valid without a socket path")
    func agentAuthValidWithoutSocketPath() {
        let config = SSHConfiguration(
            enabled: true,
            host: "bastion",
            username: "deploy",
            authMethod: .agent,
            agentSocketPath: ""
        )

        #expect(config.isValid)
    }

    @Test("Private key auth requires key path")
    func privateKeyAuthRequiresPath() {
        let config = SSHConfiguration(
            enabled: true,
            host: "bastion",
            username: "deploy",
            authMethod: .privateKey,
            privateKeyPath: ""
        )

        #expect(!config.isValid)
    }
}
