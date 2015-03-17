class User < ActiveRecord::Base
  has_many :examinations
end
