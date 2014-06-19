require 'rubygems'
require 'rspec'
require './sort.rb'

describe 'Sort' do
  describe '.selection_sort' do
    it 'returns a sorted array for positive integers' do
      list1 = [12,15,732,1,6,22,12]
      check_sort = list1.sort
      expect(Sort.selection_sort(list1)).to eq(check_sort)
    end

    it 'returns an empty array when given an empty array' do
      expect(Sort.selection_sort([])).to eq([])
    end

    it 'returns a sorted array when 0 is present' do
      list1 = [12,15,732,1,6,22,0]
      check_sort = list1.sort
      expect(Sort.selection_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array of positive and negative integers' do
      list1 = [12,15,732,-1,6,-22,-12]
      check_sort = list1.sort
      expect(Sort.selection_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array of positive and negative integers and 0' do
      list1 = [12,-15,732,1,-6,22,-12,0]
      check_sort = list1.sort
      expect(Sort.selection_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array with duplicate numbers' do
      list1 = [22,22,22,12,15,90]
      check_sort = list1.sort
      expect(Sort.selection_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array of all negative numbers' do
      list1 = [-12,-15,-732,-1,-6,-22,-12]
      check_sort = list1.sort
      expect(Sort.selection_sort(list1)).to eq(check_sort)
    end
  end

  describe '.merge_sort' do
    it 'returns a sorted array for positive integers' do
      list1 = [12,15,732,1,6,22,12]
      check_sort = list1.sort
      expect(Sort.merge_sort(list1)).to eq(check_sort)
    end

    it 'returns an empty array when given an empty array' do
      expect(Sort.merge_sort([])).to eq([])
    end

    it 'returns a sorted array when 0 is present' do
      list1 = [12,15,732,1,6,22,0]
      check_sort = list1.sort
      expect(Sort.merge_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array of positive and negative integers' do
      list1 = [12,15,732,-1,6,-22,-12]
      check_sort = list1.sort
      expect(Sort.merge_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array of positive and negative integers and 0' do
      list1 = [12,-15,732,1,-6,22,-12,0]
      check_sort = list1.sort
      expect(Sort.merge_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array with duplicate numbers' do
      list1 = [22,22,22,12,15,90]
      check_sort = list1.sort
      expect(Sort.merge_sort(list1)).to eq(check_sort)
    end

    it 'returns a sorted array of all negative numbers' do
      list1 = [-12,-15,-732,-1,-6,-22,-12]
      check_sort = list1.sort
      expect(Sort.merge_sort(list1)).to eq(check_sort)
    end
  end
end


