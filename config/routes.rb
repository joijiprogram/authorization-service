# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, skip: %i[registrations password], controllers: {
    sessions: 'admins/sessions'
  }

  authenticated :admin do
    root 'doorkeeper/applications#new', as: :authenticated_root
  end

  devise_scope :admin do
    root 'admins/sessions#new'
  end

  use_doorkeeper
end
