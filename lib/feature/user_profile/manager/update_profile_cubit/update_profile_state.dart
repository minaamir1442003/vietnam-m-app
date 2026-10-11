class UpdateProfileState {
  final String? imagePath;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const UpdateProfileState({
    this.imagePath,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  UpdateProfileState copyWith({
    String? imagePath,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return UpdateProfileState(
      imagePath: imagePath ?? this.imagePath,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
