require 'rails_helper'

RSpec.describe Task, type: :model do
    context "when attributes is invalid" do
      it 'should fail if date is empty' do
       task = build(:task, date: nil)
       expect(task).to_not be_valid  
      end

      it 'shuld fai if description is empty' do
        task = build(:task, description: nil)
        expect(task).to_not be_valid
      end
      it 'shuld fai if status is empty' do
        task = build(:task, status: nil)
        expect(task).to_not be_valid
      end

      it 'shuld fai if project_id is empty' do
        task = build(:task, project_id: nil)
        expect(task).to_not be_valid
      end
    end

    context "when attributes is valid" do
      it 'should valid ' do
        task = build(:task)
        expect(task).to be_valid 
      end
    end
    
end
