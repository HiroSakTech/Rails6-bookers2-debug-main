# frozen_string_literal: true

class NoticeMailer < ApplicationMailer
  def send_notice_mail(user, notice)
    @notice = notice
    mail(to: user.email, subject: @notice.title)
  end
end
