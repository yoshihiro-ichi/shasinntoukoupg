class ContactMailer < ApplicationMailer
    def contact_mail(picture)
      @picture = picture
      mail to: @picture.user.email, subject: "投稿が完了しました"
    end
end
