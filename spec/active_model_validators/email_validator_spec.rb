describe ActiveModelValidators::EmailValidator do
  let(:klass) do
    Class.new do
      include ::ActiveModel::Validations
      include ::ActiveModel::Dirty

      def self.model_name
        ActiveModel::Name.new(self, nil, 'temp')
      end

      define_attribute_methods [:email_addres]

      attr_accessor :email_address

      validates :email_address, :'active_model_validators/email' => true
    end
  end

  let(:object) { klass.new }

  subject { object }

  before { object.email_address = email_address }

  describe 'valdiation' do
    context 'valid email address' do
      let(:email_address) { 'test@test.com' }

      it { is_expected.to be_valid }
    end

    context 'invalid email address' do
      let(:email_address) { 'not valid email address' }

      it { is_expected.not_to be_valid }
    end
  end
end