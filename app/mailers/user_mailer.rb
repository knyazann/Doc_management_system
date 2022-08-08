class UserMailer < ApplicationMailer
    default from: 'notifications@octodocs.ru'

    def new_task_email
      @task = params[:task]
      @author = User.find_by(id: @task.goal.user_id)
      mail(to: @task.user.email, subject: 'Новое задание | OctoDocs')
    end
end
