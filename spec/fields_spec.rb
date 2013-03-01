require 'spec_helper'

describe Fields do
  describe '#parse' do
    describe 'when parsing names only' do
      let(:data) { 'alpha,beta,chi' }

      it "should return an array of names" do
        Fields.parse(data).should == ['alpha', 'beta', 'chi']
      end
    end

    describe 'when parsing a collection' do
      let(:data) { 'a=(alpha,beta)' }

      it "should return an array of names" do
        Fields.parse(data).should == [{'a' => ['alpha', 'beta']}]
      end
    end

    describe 'when parsing a nested collection and names' do
      let(:data) { 'c,d=(e,f=(g,h),i=(j),k),l' }
      it 'should return a nested array of hashes and names' do
        Fields.parse(data).should == ['c', {'d' => ['e', {'f'=> ['g', 'h'] }, {'i' => ['j']}, 'k']}, 'l']
      end
    end

    describe 'with an invalid input' do
      let(:bad_data) { [
        'c,d,e=e',
        '111,2222',
        '(a,b,c)',
        'c,d=(e,f=(g,h),i=(j),k),l=()'
        ]
      }

      it 'should return nil' do
        bad_data.each do |data|
          Fields.parse(data).should be_nil
        end
      end
    end
  end
end