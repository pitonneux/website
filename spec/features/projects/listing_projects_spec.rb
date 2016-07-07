# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'listing all the projects' do
  scenario 'on projects index page' do
    admin = create :user, :admin
    login_as admin

    create_list :project, 3

    visit projects_path

    Project.all.each do |project|
      expect(page).to have_content (project.name)
      expect(page).to have_content (project.description)
    end
  end
end
