ActionMailer::Base.add_delivery_method :ses,
                                       AWS::SES::Base,
                                       access_key_id: ENV['AWSAccessKeyId'],
                                       secret_access_key: ENV['AWSSecretKey'],
                                       server: 'email.ap-southeast-2.amazonses.com'