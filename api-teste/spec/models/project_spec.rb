require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'should fail if name project is empty' do
    project = build(:project, name: nil)

    expect(project).to_not be_valid 
  end

  it 'should valid the project' do
    project = build(:project)
    expect(project).to be_valid 
  end
end
