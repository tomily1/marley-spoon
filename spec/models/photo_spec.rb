# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Photo do
  let(:photo_object) { photo }
  let(:subject) { described_class.new(photo_object) }

  it 'should create a photo object' do
    expect(subject).to be_kind_of(Photo)
  end

  it 'should have an id attribute' do
    expect(subject.id).to be_truthy
  end

  it 'should have a url attribute' do
    expect(subject.url).to be_truthy
  end

  it 'should save the raw attribute' do
    expect(subject.raw).to eq photo_object
  end
end
