# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chef do
  let(:chef_object) { chef }
  let(:subject) { described_class.new(chef_object) }

  it 'should create a chef object' do
    expect(subject).to be_kind_of(Chef)
  end

  it 'should have an id attribute' do
    expect(subject.id).to be_truthy
  end

  it 'should have a name attribute' do
    expect(subject.name).to be_truthy
  end

  it 'should save the raw attribute' do
    expect(subject.raw).to eq chef_object
  end
end
