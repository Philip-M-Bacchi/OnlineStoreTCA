//
//  ProfileDomain.swift
//  OnlineStoreTCA
//
//  Created by Pedro Rojas on 25/08/22.
//

import ComposableArchitecture
import Foundation

struct ProfileDomain {
    struct State: Equatable {
        var profile: UserProfile = .default
        fileprivate var dataState = DataState.notStarted
        var isLoading: Bool {
            self.dataState == .loading
        }
    }

    fileprivate enum DataState {
        case notStarted
        case loading
        case complete
    }

    enum Action: Equatable {
        case fetchUserProfile
        case fetchUserProfileResponse(TaskResult<UserProfile>)
    }

    struct Environment {
        var fetchUserProfile: () async throws -> UserProfile
    }

    static let reducer = Reducer<
        State, Action, Environment
    > { state, action, environment in
        switch action {
        case .fetchUserProfile:
            if state.dataState == .complete || state.dataState == .loading {
                return .none
            }

            state.dataState = .loading
            return .task {
                await .fetchUserProfileResponse(
                    TaskResult { try await environment.fetchUserProfile() }
                )
            }

        case let .fetchUserProfileResponse(.success(profile)):
            state.dataState = .complete
            state.profile = profile
            return .none

        case let .fetchUserProfileResponse(.failure(error)):
            state.dataState = .complete
            print("Error: \(error)")
            return .none
        }
    }
}
