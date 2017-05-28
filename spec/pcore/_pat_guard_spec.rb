
#
# specifying flor
#
# Sat May 27 11:57:25 JST 2017  圓さんの家
#

require 'spec_helper'


describe 'Flor procedures' do

  before :each do

    @executor = Flor::TransientExecutor.new
  end

  describe '_pat_guard' do

    context '_pat_guard _' do

      it "doesn't match" do

        r = @executor.launch(
          %q{ _pat_guard _ },
          payload: { 'ret' => 11 })

        expect(r['point']).to eq('terminated')
        expect(r['payload']['_pat_binding']).to eq(nil)
      end
    end

    context '_pat_guard {name}' do

      it 'binds' do

        r = @executor.launch(
          %q{ _pat_guard x },
          payload: { 'ret' => 11 })

        expect(r['point']).to eq('terminated')
        expect(r['payload']['_pat_binding']).to eq({ 'x' => 11 })
      end
    end

    context '_pat_guard {conditional}' do

      it 'matches' do

        r = @executor.launch(
          %q{ _pat_guard true },
          payload: { 'ret' => 11 })

        expect(r['point']).to eq('terminated')
        expect(r['payload']['_pat_binding']).to eq({})
      end

      it 'does not match' do

        r = @executor.launch(
          %q{ _pat_guard false },
          payload: { 'ret' => 11 })

        expect(r['point']).to eq('terminated')
        expect(r['payload']['_pat_binding']).to eq(nil)
      end
    end

    context '_pat_guard {name} {pattern}' do

      it 'matches'
      it 'does not match'
    end

    context '_pat_guard {name} {conditional}' do

      it 'matches' do

        r = @executor.launch(
          %q{ _pat_guard x true },
          payload: { 'ret' => 11 })

        expect(r['point']).to eq('terminated')
        expect(r['payload']['_pat_binding']).to eq({ 'x' => 11 })
      end

      it 'does not match' do

        r = @executor.launch(
          %q{ _pat_guard x false },
          payload: { 'ret' => 11 })

        expect(r['point']).to eq('terminated')
        expect(r['payload']['_pat_binding']).to eq(nil)
      end
    end

    context '_pat_guard {name} {pattern} {conditional}' do

      it 'matches'
      it 'does not match'
    end

    context 'nested patterns' do

      it 'accepts a nested _pat_arr'
      it 'accepts a nested _pat_obj'
      it 'accepts a nested _pat_or'
      it 'accepts a nested _pat_guard'
    end
  end
end
