# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  let(:tag_object) { tag }
  let(:subject) { described_class.new(tag_object) }

  it 'should create a tag object' do
    expect(subject).to be_kind_of(Tag)
  end

  it 'should have an id attribute' do
    expect(subject.id).to be_truthy
  end

  it 'should have a name attribute' do
    expect(subject.name).to be_truthy
  end

  it 'should save the raw attribute' do
    expect(subject.raw).to eq tag_object
  end
end
