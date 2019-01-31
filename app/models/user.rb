class User < ApplicationRecord
  #カラムの名前をmount_uploaderに指定
  mount_uploader :image, ImageUploader
end
