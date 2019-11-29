//
// Created by mac on 11/29/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct PostsRepositoryBuilder {
    
    public static func make() -> PostsRepository {
        let localDataSource = PostsLocalDataSource()
        let remoteDataSource = PostsRemoteDataSource()
       return PostsRepository(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
    }
}
