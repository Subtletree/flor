
#
# specifying flor
#
# Tue Jan  2 07:51:56 JST 2018
#

require 'spec_helper'


describe 'Flor procedures' do

  before :each do

    @executor = Flor::TransientExecutor.new
  end

  describe 'inject' do

    it 'reduces with a func' do

      r = @executor.launch(
        %q{
          inject [ '0', 1, 'b', 3 ]
            res + elt
        })

      expect(r).to have_terminated_as_point
      expect(r['payload']['ret']).to eq('01b3')
    end

    it 'reduces with a func and a start value' do

      r = @executor.launch(
        %q{
          inject [ 0, 1, 2, 3 ] 7
            res + elt
        })

      expect(r).to have_terminated_as_point
      expect(r['payload']['ret']).to eq(13)
    end

    it 'reduces with a func and a start value' do

      r = @executor.launch(
        %q{
          inject 7 [ 1, 2, 3, 4 ]
            res + elt
        })

      expect(r).to have_terminated_as_point
      expect(r['payload']['ret']).to eq(17)
    end

    context 'with objects' do

      it 'reduces' do

         r = @executor.launch(
           %q{
             inject 7 { a: 1, b: 2, c: 3 }
               res + val + idx
           })

         expect(r).to have_terminated_as_point
         expect(r['payload']['ret']).to eq(16)
      end
    end
  end
end

