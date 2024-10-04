class CustomFailureApp < Devise::FailureApp
  def respond
    log_failure_reason
    super
  end

  private

  def log_failure_reason
    Rails.logger.info "Devise failure: #{warden.message || 'Unknown failure reason'}"
    Rails.logger.info "Failed login attempt from IP: #{request.remote_ip}, email: #{params[:email]}"
  end
end
