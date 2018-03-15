require "spec_helper"
require_relative "../hash_to_struct_mapper"

describe "Hash to Struct" do
  context "if call to_struct method" do
    let (:data) do
      {
        a: 1,
        b: {
          a: 12,
          b: [123, 343],
          c: {
            a: 123
          },
          d: Struct.new(:a).new('A')
        }
      }
    end

    it 'should be a Struct' do
      obj = data.to_struct
      expect(obj).to be_a Struct
    end

    it 'should return value of non-hash element' do
      obj = data.to_struct
      expect(obj.a).to eql data[:a]
    end

    it 'should return a nested hash as a new Struct' do
      obj = data.to_struct
      expect(obj.b).to be_a Struct
      expect(obj.b.a).to eql data[:b][:a]
    end

    it 'should have no change if element is an typed object' do
      obj = data.to_struct
      expect(obj.b.d.a).to eql data[:b][:d].a
    end
  end
end