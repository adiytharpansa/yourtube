package com.app.yourtube.di
import com.app.yourtube.data.newpipe.NewPipeVideoRepository
import com.app.yourtube.domain.repository.VideoRepository
import com.app.yourtube.data.repository.InterestRepositoryImpl
import com.app.yourtube.domain.repository.InterestRepository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton
@Module @InstallIn(SingletonComponent::class)
abstract class RepositoryModule {
    @Binds @Singleton abstract fun bindVideoRepository(impl: NewPipeVideoRepository): VideoRepository
    @Binds @Singleton abstract fun bindInterestRepository(impl: InterestRepositoryImpl): InterestRepository
}
