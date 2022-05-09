class UserMailer < ApplicationMailer
    default from: 'notifications@octodocs.ru'

    def new_task_email
      @task = params[:task]
      mail(to: @task.user.login, subject: 'Новое задание | OctoDocs')
    end
  
end
