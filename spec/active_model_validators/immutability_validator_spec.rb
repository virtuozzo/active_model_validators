require 'active_model_validators'

describe ActiveModelValidators::UrlValidator do
  let(:klass) do
    Class.new do
      include ::ActiveModel::Validations
      include ::ActiveModel::Dirty

      def self.model_name
        ActiveModel::Name.new(self, nil, 'temp')
      end

      define_attribute_methods [:custom_attribute]

      attr_accessor :custom_attribute
      validates :custom_attribute, :'active_model_validators/immutability' => true
    end
  end

  let(:object) { klass.new }

  subject { object }

  describe 'valdiation' do
    context 'new object' do
      before { allow(object).to receive(:new_record?).and_return true }

      it { is_expected.to be_valid }
    end

    it 'sets error' do
      allow(object).to receive(:new_record?).and_return false
      allow(object).to receive(:custom_attribute_changed?).and_return true

      expect(subject).not_to be_valid
    end
  end
end
