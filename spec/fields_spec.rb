require 'spec_helper'

describe Fields do
  describe '#parse' do
    describe 'when parsing names only' do
      let(:data) { ':alpha,beta,chi' }

      it "should return an array of names" do
        Fields.parse(data).should == [':alpha', 'beta', 'chi']
      end
    end

    describe 'when parsing a collection' do
      let(:data) { 'a(alpha,:beta)' }

      it "should return an array of names" do
        Fields.parse(data).should == [{'a' => ['alpha', ':beta']}]
      end
    end

    describe 'when parsing a collection' do
      let(:data) { 'c,d(e,f(g,h),i(j),k),l' }

      it "should return an array of names" do
        Fields.parse(data).should == ['c', {'d' => ['e', {'f'=> ['g', 'h'] }, {'i' => ['j']}, 'k']}, 'l']
      end
    end

    describe 'when parsing a nested collection and names' do
      let(:data) { 'c,d(e,f(g,h),i(j),k),l' }
      it 'should return a nested array of hashes and names' do
        Fields.parse(data).should == ['c', {'d' => ['e', {'f'=> ['g', 'h'] }, {'i' => ['j']}, 'k']}, 'l']
      end
    end

    describe 'simple nesting' do
      let(:data) { 'a(b(c(d(e))))' }

      it 'should return an array of nested hashes' do
        Fields.parse(data).should == [{'a' => [{'b' => [{'c' => [{'d' => ['e']}]} ] } ] }]
      end
    end

    describe 'with an invalid input' do
      let(:bad_data) { [
        'c,d,e=(e)',
        '111,2222',
        '(a,b,c)',
        'c,d()',
        '    ',
        'c(',
        'c(())',
        'c(a()',
        '(a)',
        'alpha,beta,(gama,delta),epsilon',
        'a,(c)',
        'a(c))'
        ]
      }

      it 'should return nil' do
        bad_data.each do |data|
          unless Fields.parse(data).nil?
            fail "Tried to parse the bad string '#{data}' and it generated #{Fields.parse(data)}"
          end
        end
      end
    end

    describe 'performance', :perf => true do
      let(:data) { 'name,description,blars_tacoman(lettuce,meat(beef,horse),iguana(jerky),cheese),leche' }
      let(:bad_data) { 'name,description,blars_tacoman(lettuce,meat(beef,horse),iguana(jerky),cheese),leche)' }
      it 'should be fast' do
        require 'benchmark'
        Benchmark.bmbm do |bm|
          bm.report('parse') { 1000.times { Fields.parse(data) }}
          bm.report('parse bad') { 1000.times { Fields.parse(bad_data) } }
        end
      end
    end
  end
end
