OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1973951366220686', '640de0f44e8d9ec79af4eccf6661b10c'
  provider :vkontakte, '6036834', 'MUA7TxNQ43Mr4HboAshV',
  {
      :scope => 'friends,audio,photos',
      :display => 'popup',
      :info_fields => 'first_name, last_name, email'
    }
end
