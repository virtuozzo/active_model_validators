require 'custom_validators'

describe CustomValidators::UrlValidator do
  let(:message) { 'must be valid URL' }
  let(:custom_message) { 'custom message'}
  let(:attribute) { 'invalid_url' }
  let(:custom_attribute) { 'invalid_url' }
  let(:klass) do
    Class.new do
      include ::ActiveModel::Validations

      attr_accessor :attribute
      validates :attribute, :'custom_validators/url' => true

      attr_accessor :custom_attribute
      validates :custom_attribute,
                :'custom_validators/url' => {
                                               message: 'custom message',
                                               protocols: [URI::HTTP, URI::FTP]
                                            },
                allow_blank: true
    end
  end

  subject do
    klass.new.tap do |v|
      v.attribute = attribute
      v.custom_attribute = custom_attribute
    end
  end

  context 'with invalid attribute' do
    before { subject.valid? }

    it { is_expected.not_to be_valid }
    specify { expect(subject.errors[:attribute]).to include message }
    specify { expect(subject.errors[:custom_attribute]).to include custom_message }
  end

  context 'validates attribute by protocol type' do
    let(:attribute) { 'http://valid.com' }
    let(:custom_attribute) { 'http://valid.com' }

    context 'defaults' do
      %w(http https).each do |type|
        context "#{type}" do
          let(:attribute) { "#{type}://valid.com/" }

          it { is_expected.to be_valid }
        end
      end
    end

    context 'custom protocol' do
      %w(http ftp).each do |type|
        context "#{type}" do
          let(:custom_attribute) { "#{type}://valid.com/" }

          it { is_expected.to be_valid }
        end
      end
    end
  end
end
