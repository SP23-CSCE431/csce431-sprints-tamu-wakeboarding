# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe('Member Pages Without Access', type: :feature) do
  let(:admin) { Admin.create!(email: "chrispasala@tamu.edu", first_name: "first", last_name: "last", is_approved: true) }

  before :each do
    allow_any_instance_of(ApplicationController).to(receive(:authenticate_admin!).and_return(true))
    allow_any_instance_of(ApplicationController).to(receive(:current_admin).and_return(admin))
    allow_any_instance_of(Admin).to(receive(:has_role?).with("Admin").and_return(false))
    allow_any_instance_of(Admin).to(receive(:has_role?).with("Driver").and_return(false))
    allow_any_instance_of(Admin).to(receive(:has_role?).with("Treasurer").and_return(false))
  end

  it 'visiting member page without sufficient permissions' do
    visit users_path
    expect(page).to(have_content('You do not have access'))
  end
end

RSpec.describe('Member Pages With Access', type: :feature) do
  let(:chris) { Admin.create!(email: "chrispasala@tamu.edu", first_name: "first", last_name: "last", is_approved: true) }

  before :each do
    allow_any_instance_of(ApplicationController).to(receive(:authenticate_admin!).and_return(true))
    allow_any_instance_of(ApplicationController).to(receive(:current_admin).and_return(chris))
    allow_any_instance_of(Admin).to(receive(:has_role?).with("Admin").and_return(true))
    allow_any_instance_of(Admin).to(receive(:has_role?).with("Driver").and_return(false))
    allow_any_instance_of(Admin).to(receive(:has_role?).with("Treasurer").and_return(false))
  end

  it 'visiting member page with sufficient permissions' do
      visit users_path
      expect(page).to(have_content('chrispasala'))
  end

  it 'visiting member approval page with sufficient permissions' do
      Admin.create!(email: "realemailreal@tamu.edu", first_name: "test", last_name: "test", is_approved: false)
      visit users_to_approve_path
      expect(page).to(have_content("realemailreal@tamu.edu"))
  end

  it 'approving member page with sufficient permissions' do
      Admin.create!(email: "realemailreal@tamu.edu", first_name: "test", last_name: "test", is_approved: false)
      visit users_to_approve_path
      click_on("Approve User")
      visit users_path
      expect(page).to(have_content("realemailreal@tamu.edu"))
  end

  it 'denying member page with sufficient permissions' do
    Admin.create!(email: "realemailreal@tamu.edu", first_name: "test", last_name: "test", is_approved: false)
    visit users_to_approve_path
    click_on("Deny User")
    visit users_to_approve_path
    expect(page).not_to(have_content("realemailreal@tamu.edu"))
  end  
  
  it 'destroying member page with sufficient permissions' do
    user = Admin.create!(email: "realemailreal@tamu.edu", first_name: "test", last_name: "test", role_id: 0, is_approved: false)
    visit edit_admin_path(user)
    click_on("Destroy")
    visit users_path
    expect(page).not_to(have_content("realemailreal@tamu.edu"))
  end

  it 'editing member page with sufficient permissions' do
    user = Admin.create!(email: "realemailreal@tamu.edu", first_name: "test", last_name: "test", role_id: 0, is_approved: true)
    visit edit_admin_path(user)
    fill_in "admin[first_name]", with: 'Chris'
    click_on 'Update Account Info'
    visit users_path
    expect(page).to(have_content("Chris"))
  end


end
