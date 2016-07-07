# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'creating a new project' do
  scenario 'from projects index' do
    admin = create :user, :admin
    login_as admin

    visit projects_path
    find('summary', text: 'Add a new project').click

    fill_form :project, name: 'New project',
      description: 'Build a project together and get paid'
    click_button 'Create project'
    expect(page).to have_content 'New project'
    expect(page).to have_content 'Build a project together and get paid'
  end
end
