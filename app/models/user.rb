class User < ActiveRecord::Base
  validates :skype_name,
            length: {
              in: 6..32,
            },
            format: {
              with: /\A[a-zA-Z\d][\w,.-]+\z/,
              message:  "は正しいSkype名形式で入力して下さい"
            }
end
