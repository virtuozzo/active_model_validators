require 'custom_validators'
require 'active_model'

describe CustomValidators::NumericArrayValidator do
  # coz: array.wrap - array()
  let(:validator) { described_class.new({attributes: [{}]}) }
  let(:error) { 'Should be an array of integers' }
  let(:record) do
    record = double('model')
    allow(record).to receive(:errors).and_return(ActiveModel::Errors.new(record))
    record
  end

  describe '#validate_each?' do
    it 'is not valid if array consist nil' do
      expect(record_errors [1, nil]).to include error
    end

    it 'is not valid if array consist nil' do
      expect(record_errors [1, 2.22]).to include error
    end

    it 'is valid if array is empty' do
      expect(record_errors []).to be_empty
    end

    it 'is valid if array consist of integer values' do
      expect(record_errors [1, 2]).to be_empty
    end

    def record_errors(array)
      validator.validate_each(record, "array", array)
      record.errors[:array]
    end
  end
end
