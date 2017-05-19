OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1973951366220686', '640de0f44e8d9ec79af4eccf6661b10c', scope: 'email', info_fields: 'email,name,first_name,last_name,gender'
  provider :vkontakte, '6036834', 'MUA7TxNQ43Mr4HboAshV', scope: 'email', info_fields: 'email,name,first_name,last_name,gender', :display => 'popup',
end
