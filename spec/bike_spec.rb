require 'bike'

describe Bike do
  describe '#working?'do
    it {is_expected.to respond_to :working?}

    it  'returns true when working is called' do
      expect(subject.working?).to eq true
    end
  end

  describe '#report_bike' do
    it { is_expected.to respond_to :report_bike}

    it 'user can report bike as broken' do
      subject.report_bike
      expect(subject.working?).to eq false
    end
  end
end
