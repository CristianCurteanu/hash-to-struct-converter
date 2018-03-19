require 'benchmark/ips'
require 'ostruct'
require './hash_to_struct_mapper'

Benchmark.ips do |bm|
  bm.report('Hash#to_struct') do
    { latitude: 53.6, longitude: 11.4 }.to_struct
  end

  bm.report('OpenStruct.new') do
    OpenStruct.new({ a: "A", b: "B", question: { answer: 42 } })
  end
end