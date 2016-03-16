class Avatar < ActiveRecord::Base
  belongs_to :avatarable, :polymorphic => true
  mount_uploader :photo, AvatarUploader

  def is_image
    str = self.photo.path.split(".").last
    image_type = "bmp,jpg,jpeg,png,tiff,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw"
    if image_type.include?(str)
      return true
    else
      return false
    end
  end
end
